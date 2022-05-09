import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../models/user_response.dart';

class ApiUser {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<UserResponse> getUserList(
      {int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/user/?page=$page&limit=$limit'),
        headers: {'app-id': '626fc933e000f6ac62f05f14'});
    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }

  static Future<User> getDetails(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id'),
        headers: {'app-id': '626fc933e000f6ac62f05f14'});
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception(
        'Errore in ricevere i dettagli dell utente ${response.body}');
  }
}
