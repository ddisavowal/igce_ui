import 'package:shared_preferences/shared_preferences.dart';

class SPRepository {
  SPRepository({required this.preferences});

  final SharedPreferences preferences;

  Future<bool?> getBoolLocalData(String key) async {
    return Future.value(preferences.getBool(key));
  }

  Future<int?> getIntLocalData(String key) async {
    return Future.value(preferences.getInt(key));
  }

  Future<String?> getStringLocalData(String key) async {
    return Future.value(preferences.getString(key));
  }

  Future<List<String>?> getStringListLocalData(String key) async {
    return Future.value(preferences.getStringList(key));
  }

  Future<void> setBoolLocalData(String key, bool value) async {
    await preferences.setBool(key, value);
  }

  Future<void> setIntLocalData(String key, int value) async {
    await preferences.setInt(key, value);
  }

  Future<void> setStringLocalData(String key, String value) async {
    await preferences.setString(key, value);
  }

  Future<void> setStringListLocalData(String key, List<String> value) async {
    await preferences.setStringList(key, value);
  }

  Future<void> clearLocalData() async {
    await preferences.clear();
  }

  Future<void> clearLocalDataByKey(String key) async {
    await preferences.remove(key);
  }
}
