import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/tag_response.dart';

class ApiTag {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<TagResponse> getUserList({int page = 0, int limit = 20}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/tag?page=$page&limit=$limit'), headers: {
      'app-id': '626fc933e000f6ac62f05f14',
    });

    if (response.statusCode == 200) {
      return TagResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }

  static Future<TagResponse> getPostfotTag(String tags) async {
    final response =
        await http.get(Uri.parse('$baseUrl/tag/$tags/post'), headers: {
      'app-id': '626fc933e000f6ac62f05f14',
    });

    if (response.statusCode == 200) {
      return TagResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
}
