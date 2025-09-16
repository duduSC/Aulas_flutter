import 'dart:convert';

import 'package:flutter_application_1/models/user.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Userservice {
  static const String url = "https://68b0e9e73b8db1ae9c0526f5.mockapi.io/users";

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((usuario) {
        return User.fromJson(usuario);
      }
      ).toList();
      
    } else {
      throw Exception("Falha ao carregar os dados do usuario ${response.statusCode}");
    }
  }
}
