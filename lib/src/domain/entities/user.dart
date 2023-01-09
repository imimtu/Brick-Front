import 'dart:convert';

class User {
  final String name;

  final String email;

  User({
    required this.name,
    required this.email,
  });

  // TODO(Kangmin): toJson 구현
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    return json;
  }

  // TODO(Kangmin): fromJson 구현
  static User fromJson(json) {
    if (json is String) {
      json = jsonDecode(json);
    }

    return User(
      name: '',
      email: '',
    );
  }
}
