class User {
  final String? id;
  final String name;
  final String email;
  final String picture;
  final String dogName;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.dogName,
    required this.picture
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      dogName: json["dogName"] as String,
      picture: json["picture"] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) "id": id,
      "nome": name,
      "email": email,
      "dogName": dogName,
      "picture": picture,
    };
  }
}
