import 'dart:convert';

import 'package:apiuserquote/models/users_auotgenerate.dart';
import 'package:http/http.dart' as http;

class ApiUsers {
  static Future<UserAutoGenerate> getUserFromInternet(int skip) async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/users?skip=$skip"));

    if (response.statusCode == 200) {
      return UserAutoGenerate.fromJson(jsonDecode(response.body));
    }

    throw Exception('Error: ${response.statusCode} - ${response.reasonPhrase}');
  }
}
