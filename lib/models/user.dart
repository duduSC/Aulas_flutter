class User {
  final String? id;
  final String name;
  final String email;
  final String picture;
  final String dogName;
  final DateTime? birthDay;
  User({
    this.id,
    required this.name,
    required this.email,
    required this.dogName,
    required this.picture,
    this.birthDay,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      dogName: json["dogName"] as String,
      picture: json["picture"] as String,
      birthDay: json["birthDay"] != null && json["birthDay"] != '' ? DateTime.tryParse(json['birthday']) : null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) "id": id,
      "nome": name,
      "email": email,
      "dogName": dogName,
      "picture": picture,
      "birthDay": birthDay?.toIso8601String(),
    };
  }
}
