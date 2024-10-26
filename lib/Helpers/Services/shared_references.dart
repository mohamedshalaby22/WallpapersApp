import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage {
  static const String loginKey = 'isLoggedIn';

  // Save a boolean value to SharedPreferences
  static Future<void> setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, value);
  }

  // Get the boolean value from SharedPreferences
  static Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginKey) ?? false; // Default to false if not set
  }

  static Future clearPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear(); // Default to false if not set
  }
}
