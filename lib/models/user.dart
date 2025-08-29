import 'dart:ffi';

class User {
  final int id;
  final String name;
  final String email;
  final String picture;
  final String dogName;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.dogName,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
      dogName: json["dogName"] as String,
      picture: json["picture"] as String,
    );
  }
}
