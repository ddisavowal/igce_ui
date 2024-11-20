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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                                color: context.colorTheme.defaultColor)
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
                                color: context.colorTheme.defaultColor)
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
                                color: context.colorTheme.defaultColor)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      floatingActionButton: DefaultFloatingButton(
        text: 'example',
        onPressed: _incrementCounter,
      ),
    );
  }
}
