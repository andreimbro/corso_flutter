import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../models/post_response.dart';

class ApiPost {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<PostResponse> getPostList(
      {int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post?page=$page&limit=$limit'),
        headers: {'app-id': '626fc933e000f6ac62f05f14'});

    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti ${response.body}');
  }

  static Future<Post> getDetails(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/post/$id'),
        headers: {'app-id': '626fc933e000f6ac62f05f14'});

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception(
        'Errore in ricevere i dettagli dell utente ${response.body}');
  }

  static Future<PostResponse> getPostByUser(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id/post'),
        headers: {'app-id': '626fc933e000f6ac62f05f14'});

    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception(
        'Errore in ricevere i dettagli dell utente ${response.body}');
  }
}
