import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage{
  static const _loginKey = 'logged_in';
  static const _userKey = 'username';
  static Future<void> saveLogin(String name) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, true);
    await prefs.setString(_userKey, name);
  }
  static Future<bool> isLoggedIn() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }
  static Future<String> getUsername() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey) ?? '';
  }
  static Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}