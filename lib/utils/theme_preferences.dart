import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences{

  static saveTheme({required bool isDark}) async {

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDark') ?? false;
  }
}
