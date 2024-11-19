1. Создать новый проект 
    //
    flutter create app_name

2. В файле pubspec.yaml в зависимости добавить путь к пакету
3. В файле pubspec.yaml в зависимости добавить flutter_bloc, shared_preferences
    Пример:
    //
    dependencies:
    flutter:
        sdk: flutter
    igce_theme:
        path: ../igce_theme
    flutter_bloc: ^8.1.6
    shared_preferences: ^2.3.2
4. В main создать инстанс SharedPreferences, передать его в виджет приложения.
   Обернуть приложение в BlocProvider, указать в провайдере блок темы (импортировать из пакета ThemeCubit, ThemeRepository).
   В виджете MaterialApp добавить светлую и темную тему из класса IgceAppTheme, в themeMode указать состояние.
   Пример:
    //
    void main() async {
        WidgetsFlutterBinding.ensureInitialized();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        runApp(MyApp(
            prefs: prefs,
        ));
    }
    // This widget is the root of your application.
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
                home: const MyHomePage(title: 'Flutter Demo Home Page'),
                debugShowCheckedModeBanner: false,
                );
            }),
            );
        
        }
    }

5. Использовать готовые компоненты, импортируя 'package:igce_theme/ui/ui.dart'
6. 