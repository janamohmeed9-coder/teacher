import 'dart:convert';

import 'package:fluterrr/api_client.dart';
import 'token_storage.dart';

class AuthService {
  static const String loginEndpoint = "/auth/login";

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      loginEndpoint,
      {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is Map<String, dynamic> && data["token"] != null) {
        await TokenStorage.save(
          token: data["token"],
          role: data["role"] ?? '',
          expiresAt: data["expiresAt"] ?? '',
        );

        return true;
      }
    }

    return false;
  }
}
