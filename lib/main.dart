import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igce_theme/igce_theme.dart';
import 'package:igce_theme/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThemeCubit(themeRepository: ThemeRepository(preferences: prefs)),
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
        text: 'example',
        onPressed: () {},
      ),
    );
  }
}
