import 'package:shared_preferences/shared_preferences.dart';

class SharedUtil {

  static insertData(String key, String value) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> fetchData(String key) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    return value;
  }

  static clearData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
