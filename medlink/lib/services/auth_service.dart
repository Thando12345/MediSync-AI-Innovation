// lib/services/auth_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class AuthService {
  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://example.com/login'),
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromMap(data);
    } else {
      throw Exception('Failed to login');
    }
  }

  // Add other methods like logout, refresh token, etc.
}
