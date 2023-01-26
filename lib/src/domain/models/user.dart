import 'dart:convert';

import 'package:just_util/just_util.dart';

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

    json.setIfPresent(key: 'name', val: name);
    json.setIfPresent(key: 'email', val: email);

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
