import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/data/repositories/sp_repository.dart';

class DependenciesInitializer {
  static final getIt = GetIt.instance;

  static setup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // external dependencies internal dependencies
    getIt.registerSingleton<SharedPreferences>(prefs);
    getIt.registerSingleton<SPRepository>(SPRepository(preferences: prefs));
  }
}
