import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/comment.dart';
import '../models/comment_response.dart';

class ApiComment {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<CommentResponse> getUserList(
      {int page = 0, int limit = 20}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/comment?page=$page&limit=$limit'), headers: {
      'app-id': '626fc933e000f6ac62f05f14',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }

  static Future<CommentResponse> getCommentsFromPost(String id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/post/$id/comment'), headers: {
      'app-id': '626fc933e000f6ac62f05f14',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }

  static Future<CommentResponse> getCommentsFromUsers(String id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/user/$id/comment'), headers: {
      'app-id': '626fc933e000f6ac62f05f14',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }

  static Future<Comment> addCommentTo(String postId, String message) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userId = sp.getString('logKey');

    if (userId == null) {
      throw Exception('Impossibile insere un commento,non sei loggato');
    }
    final http.Response response = await http.post(
        Uri.parse('$baseUrl/comment/create'),
        headers: {
          'app-id': '626fc933e000f6ac62f05f14',
          'Content-Type': 'application/json'
        },
        body:
            jsonEncode({'owner': userId, 'post': postId, 'message': message}));

    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore invio commento: ${response.body}');
  }

  static Future<bool> deleteComment(String idComment) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/comment/$idComment'), headers: {
      'app-id': '626fc933e000f6ac62f05f14',
    });

    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Errore impossibile elliminare il commento:'
        '${response.body} ');
  }
}
