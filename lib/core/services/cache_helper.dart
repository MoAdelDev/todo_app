import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey('isDark')) {
      await saveData(key: 'isDark', value: false);
    }
  }

  static Future<bool> saveData({required key, required value}) async {
    return sharedPreferences.setBool(key, value);
  }

  static bool? getData({required key}) {
    return sharedPreferences.getBool(key);
  }
}
