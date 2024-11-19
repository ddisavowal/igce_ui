# Шаги для настройки проекта

1. Создать новый проект:
    ```bash
    flutter create app_name
    ```

2. В файле `pubspec.yaml` в разделе `dependencies` добавьте путь к пакету:

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      igce_theme:
        path: ../igce_theme
    ```

3. В файле `pubspec.yaml` в разделе `dependencies` добавьте также `flutter_bloc` и `shared_preferences`:
    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      igce_theme:
        path: ../igce_theme
      flutter_bloc: ^8.1.6
      shared_preferences: ^2.3.2
    ```

4. В `main.dart` создайте инстанс `SharedPreferences`, передайте его в виджет приложения. Оберните приложение в `BlocProvider`, укажите в провайдере блок темы (импортировать из пакета `ThemeCubit`, `ThemeRepository`). В виджете `MaterialApp` добавьте светлую и тёмную темы из класса `IgceAppTheme`, в `themeMode` укажите текущее состояние.

    ```dart
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
          create: (context) => ThemeCubit(
            themeRepository: ThemeRepository(preferences: prefs),
          ),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: IgceAppTheme.lightTheme,
                darkTheme: IgceAppTheme.darkTheme,
                themeMode: state.themeMode,
                home: const MyHomePage(title: 'Flutter Demo Home Page'),
                debugShowCheckedModeBanner: false,
              );
            },
          ),
        );
      }
    }
    ```

5. Используйте готовые компоненты, импортируя их с помощью:

    ```dart
    import 'package:igce_theme/ui/ui.dart';
    ```
