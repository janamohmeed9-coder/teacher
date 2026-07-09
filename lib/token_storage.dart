import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _tokenKey = "token";
  static const String _roleKey = "role";
  static const String _expiresKey = "expiresAt";

  static Future<void> save({
    required String token,
    required String role,
    required String expiresAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
    await prefs.setString(_roleKey, role);
    await prefs.setString(_expiresKey, expiresAt);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}