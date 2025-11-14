import 'package:quiz_app/features/data/data_sources/local/shared_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future saveUsername(String username) async {
    await _prefs.setString(SharedKey.userName, username);
  }

  static String? getUsername() {
    return _prefs.getString(SharedKey.userName);
  }
  static Future saveUserRate(int rate) async {
    await _prefs.setInt(SharedKey.userRate, rate);
  }

  static int? getUserRate() {
    return _prefs.getInt(SharedKey.userRate);
  }

  static Future clearAll() async {
    await _prefs.clear();
  }
}
