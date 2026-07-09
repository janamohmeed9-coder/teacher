import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';

class ApiClient {
  static const String baseUrl = "http://10.0.2.2:8080/api/v1";

  static Future<Map<String, String>> headers() async {
    final token = await TokenStorage.getToken();

    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  static Uri _uriFromEndpoint(String endpoint) {
    if (endpoint.startsWith('http://') || endpoint.startsWith('https://')) {
      return Uri.parse(endpoint);
    }

    final normalizedEndpoint = endpoint.startsWith('/') ? endpoint : '/$endpoint';
    return Uri.parse('$baseUrl$normalizedEndpoint');
  }

  static Future<http.Response> get(String endpoint) async {
    return http.get(
      _uriFromEndpoint(endpoint),
      headers: await headers(),
    );
  }

  static Future<http.Response> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return http.post(
      _uriFromEndpoint(endpoint),
      headers: await headers(),
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> put(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return http.put(
      _uriFromEndpoint(endpoint),
      headers: await headers(),
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> delete(String endpoint) async {
    return http.delete(
      _uriFromEndpoint(endpoint),
      headers: await headers(),
    );
  }
}