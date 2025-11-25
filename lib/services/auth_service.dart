import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Change this base URL depending on your dev setup:
  // - Android emulator: http://10.0.2.2:5000
  // - iOS simulator: http://127.0.0.1:5000
  // - Physical device: use your machine IP (e.g., http://192.168.1.100:5000)
  static const String baseUrl = 'http://10.235.8.136:5000';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> signup({
    required String fullName,
    required String phone,
    required String password,
    String? email,
  }) async {
    final uri = Uri.parse('$baseUrl/signup');
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'full_name': fullName,
        'phone': phone,
        'password': password,
        if (email != null) 'email': email,
      }),
    );

    final body = jsonDecode(res.body);

    if (res.statusCode == 200) {
      final token = body['access_token'];
      if (token != null) {
        await _storage.write(key: 'access_token', value: token);
      }
      return body;
    } else {
      throw Exception(body['error'] ?? 'Signup failed');
    }
  }

  Future<Map<String, dynamic>> login({
    String? phone,
    String? email,
    required String password,
  }) async {
    final uri = Uri.parse('$baseUrl/login');
    final bodyPayload = <String, String>{'password': password};
    if (phone != null) {
      bodyPayload['phone'] = phone;
    } else if (email != null) {
      bodyPayload['email'] = email;
    }

    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(bodyPayload),
    );

    final body = jsonDecode(res.body);

    if (res.statusCode == 200) {
      final token = body['access_token'];
      if (token != null) {
        await _storage.write(key: 'access_token', value: token);
      }
      return body;
    } else {
      throw Exception(body['error'] ?? 'Login failed');
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    final token = await _storage.read(key: 'access_token');
    if (token == null) throw Exception('Not authenticated');
    final uri = Uri.parse('$baseUrl/me');
    final res = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final body = jsonDecode(res.body);
    if (res.statusCode == 200) return body;
    throw Exception(body['error'] ?? 'Failed to fetch profile');
  }

  Future<String?> getToken() async => await _storage.read(key: 'access_token');
  Future<void> logout() async => await _storage.delete(key: 'access_token');
}

/*

/// Simple authentication service using SharedPreferences
/// This is a placeholder for demonstration - in production, you'd use a real backend
class AuthService {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userEmailKey = 'user_email';
  static const String _userNameKey = 'user_name';

  /// Login user with email and password
  /// Returns true if successful, false otherwise
  static Future<bool> login(String email, String password) async {
    // Simulate validation
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    // In a real app, you'd validate against a backend
    // For now, accept any non-empty email/password
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_userEmailKey, email);
    
    return true;
  }

  /// Register a new user
  /// Returns true if successful, false otherwise
  static Future<bool> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    // Basic validation
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }

    if (password != confirmPassword) {
      return false;
    }

    // In a real app, you'd register with a backend
    // For now, just store the user data
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userNameKey, name);
    
    return true;
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  /// Logout user
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userNameKey);
  }

  /// Get current user email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  /// Get current user name
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }
}


*/
