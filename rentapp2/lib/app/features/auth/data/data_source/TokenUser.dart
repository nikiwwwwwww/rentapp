import 'package:shared_preferences/shared_preferences.dart';

class TokenUser {
  static const String _tokenKey = 'jwt';
  static const String _tokenKeyEmail = 'emailuser';


  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> setToken(String _token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, _token);
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKeyEmail);
  }

  Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKeyEmail, email);
  }

}
