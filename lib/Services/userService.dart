import 'dart:convert';

import 'package:flutter_application_1/models/user.dart';
import 'package:http/http.dart' as http;

class Userservice {
  static const String userUrl =
      "https://68b0e9e73b8db1ae9c0526f5.mockapi.io/users";

  Future<User> getRandomUser() async {
    final response = await http.get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      return User.fromJson(jsonEncode(response.body) as Map<String, dynamic>);
    }
    throw Exception("Erro interno, chama o dev ${response.statusCode}");
  }
}
