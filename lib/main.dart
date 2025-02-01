import 'dart:collection';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:igce_theme/igce_theme.dart';
import 'package:igce_theme/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/data/app/dependencies_init.dart';
import 'package:test_project/data/models/chatMessage.dart';
import 'package:test_project/data/repositories/sp_repository.dart';

import 'data/blocs/bloc/messages_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await DependenciesInitializer.setup();
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ThemeCubit(themeRepository: ThemeRepository(preferences: prefs)),
        ),
        BlocProvider(
          create: (context) => MessagesBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: IgceAppTheme.lightTheme,
          darkTheme: IgceAppTheme.darkTheme,
          themeMode: state.themeMode,
          home: const MyHomePage(title: 'Test Web'),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void settingsTheme(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            ThemeMode themeMode = state.theme;
            return AlertDialog(
              title: Text(
                'Выберите тему',
                style: context.textTheme.blueText20Fat,
              ),
              contentPadding: const EdgeInsets.only(bottom: 30),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(dialogContext).size.width * 0.6,
                      height: 40,
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        title: Text(
                          'Светлая',
                          style: context.textTheme.defaultText16Fat,
                        ),
                        trailing: themeMode == ThemeMode.light
                            ? Icon(Icons.check,
                                color: context.colorTheme.primaryColor)
                            : const SizedBox(height: 0),
                        onTap: () => context
                            .read<ThemeCubit>()
                            .setTheme(ThemeMode.light),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(dialogContext).size.width * 0.6,
                      height: 40,
                      child: ListTile(
                        title: Text(
                          'Темная',
                          style: context.textTheme.defaultText16Fat,
                        ),
                        trailing: themeMode == ThemeMode.dark
                            ? Icon(Icons.check,
                                color: context.colorTheme.primaryColor)
                            : const SizedBox(height: 0),
                        onTap: () =>
                            context.read<ThemeCubit>().setTheme(ThemeMode.dark),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(dialogContext).size.width * 0.6,
                      height: 40,
                      child: ListTile(
                        title: Text(
                          'Системная',
                          style: context.textTheme.defaultText16Fat,
                        ),
                        trailing: themeMode == ThemeMode.system
                            ? Icon(Icons.check,
                                color: context.colorTheme.primaryColor)
                            : const SizedBox(height: 0),
                        onTap: () => context
                            .read<ThemeCubit>()
                            .setTheme(ThemeMode.system),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  TextEditingController textController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  bool isClearEnable = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        isClearEnable = searchController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      title: widget.title,

      leading: DefaultMenu(itemsTitle: const [
        'Еще что-то',
        'Витрина проектов',
        'Настройки',
      ], itemsIcon: const [
        Icons.abc,
        Icons.personal_injury_outlined,
        Icons.settings
      ], onItemsSelected: [
        () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Выбрано значение 1')),
            ),
        () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Выбрано значение 2')),
            ),
        () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Выбрано значение 3')),
            )
      ]),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SearchFormField(
          padding: const EdgeInsets.all(10),
          labelText: 'Пример поля поиска',
          controller: searchController,
          isClearEnable: isClearEnable,
          onChanged: (query) {},
          onClearPressed: () => setState(() {
            searchController.clear();
          }),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                  leading: Icon(Icons.palette,
                      color: context.theme.colorScheme.onSurface),
                  title: Text(
                    'Тема',
                    style: context.textTheme.defaultText14,
                  ),
                  onTap: () => settingsTheme(context)),
              const SizedBox(height: 30),
              DefaultContainer(
                  child: Text(
                'Это пример текста для стандартного контейнере',
                style: context.textTheme.defaultText14,
              )),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: context.colorTheme.defaultColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
              ),
              const SizedBox(height: 30),
              DefaultFormField(
                labelText: 'Пример текстового поля',
                controller: textController,
              ),
              const SizedBox(height: 30),
              IconCard(
                icon: Icon(Icons.home),
                title: 'Это пример icon card',
                onTap: () => null,
              ),
              const SizedBox(height: 30),
              ArrowCard(
                title: 'Это пример arrow card',
                onTap: () => null,
              ),
              const SizedBox(height: 30),
              IconListTile(
                icon: Icons.favorite,
                title: 'Это пример icon list tile',
                onTap: () {},
              ),
              const SizedBox(height: 30),
              ElevatedButton50(
                text: 'Сохранить',
                onPressed: () => null,
              ),
              const SizedBox(height: 15),
              const ElevatedButton70(
                text: 'Сохранить изменения',
                onPressed: null,
              ),
              const SizedBox(height: 15),
              FilledButton50(
                text: 'Продолжить',
                onPressed: () => null,
              ),
              const SizedBox(height: 15),
              const FilledButton70(
                text: 'Подробнее узнать',
                onPressed: null,
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          Container(height: 70, color: context.colorTheme.defaultColor),
      floatingActionButton: DefaultFloatingButton(
        text: 'Bot',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Botpage()),
          );
        },
      ),
    );
  }
}

class Botpage extends StatefulWidget {
  const Botpage({super.key});

  @override
  State<Botpage> createState() => _BotpageState();
}

class _BotpageState extends State<Botpage> {
  SPRepository spRepository = GetIt.instance<SPRepository>();
  List<MessageModel> chatHistory = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadChatHistory();
  }

  void saveChatHistory() async {
    final messages = chatHistory
        .map((msg) => jsonEncode({
              'text': msg.text,
              'isSentByUser': msg.isSentByUser,
              'timestamp': msg.timestamp.toIso8601String(),
            }))
        .toList();
    spRepository.setStringListLocalData('chatHistory', messages);
  }

  void loadChatHistory() async {
    final messages = await spRepository.getStringListLocalData('chatHistory');
    setState(() {
      chatHistory = messages!.map((msg) {
        final data = jsonDecode(msg);
        return MessageModel(
          text: data['text'],
          isSentByUser: data['isSentByUser'],
          timestamp: DateTime.parse(data['timestamp']),
        );
      }).toList();
    });
  }

  void sentMessage(String text) {
    MessageModel userMessage =
        MessageModel(text: text, isSentByUser: true, timestamp: DateTime.now());
    String botText = 'Ответ бота';
    MessageModel botMessage = MessageModel(
        text: botText, isSentByUser: false, timestamp: DateTime.now());
    chatHistory.add(userMessage);
    chatHistory.add(botMessage);
    saveChatHistory();
    setState(() {});
  }

  MessagesBloc messageBloc = MessagesBloc();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Bot',
      body: BlocBuilder<MessagesBloc, MessagesState>(
        bloc: messageBloc..add(LoadMessagesListEvent()),
        builder: (context, state) {
          if (state.messages == null) {
            messageBloc.add(LoadMessagesListEvent());
          }
          if (state.isLoading || state.messages == null) {
            return CircularProgressIndicator();
          }
          if (state.error != null) {
            return Text('error');
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  // reverse: true, // Чтобы последние сообщения были внизу
                  itemCount: state.messages!.length,
                  itemBuilder: (context, index) {
                    final message = state.messages![index];
                    return Align(
                      alignment: message.isSentByUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: message.isSentByUser
                              ? context.colorTheme.mainClickColor
                              : context.colorTheme.backgroundWidgetColor,
                          borderRadius: message.isSentByUser
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                          boxShadow: [
                            BoxShadow(
                              color: context.colorTheme.boxShadowColor,
                              offset: const Offset(0, 0), // X0 Y0
                              blurRadius: 6, // Blur 6
                              spreadRadius: 0, // Spread 0
                            ),
                          ],
                        ),
                        child: Text(message.text),
                      ),
                    );
                  },
                ),
              ),
              Container(
                // height: 100,
                // width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                color: context.colorTheme.defaultColor,
                child: Row(
                  children: [
                    Expanded(
                      child: DefaultFormField(
                        // labelText: 'Введите сообщение',
                        hintText: 'Введите сообщение',
                        controller: textController,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          // sentMessage(textController.text);
                          messageBloc.add(
                              SendMessageEvent(message: textController.text));
                          textController.clear();
                        },
                        icon: Icon(Icons.send))
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
