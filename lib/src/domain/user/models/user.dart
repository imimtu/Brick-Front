import 'dart:convert';

import 'package:just_util/just_util.dart';

class User {
  final String id;

  final String name;

  final String nickName;

  final String email;

  final String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json.setIfPresent(key: 'id', val: id);
    json.setIfPresent(key: 'name', val: name);
    json.setIfPresent(key: 'nickName', val: nickName);
    json.setIfPresent(key: 'email', val: email);
    json.setIfPresent(key: 'phoneNumber', val: phoneNumber);

    return json;
  }

  factory User.fromJson(json) {
    Map<String, dynamic> parsedJson = {};

    if (json is String) {
      parsedJson = jsonDecode(json);
    } else if (json is Map<String, dynamic>) {
      parsedJson = json;
    }

    return User(
      id: parsedJson.getIfPresent(key: 'id', defaultVal: ''),
      name: parsedJson.getIfPresent(key: 'name', defaultVal: ''),
      nickName: parsedJson.getIfPresent(key: 'nickName', defaultVal: ''),
      email: parsedJson.getIfPresent(key: 'email', defaultVal: ''),
      phoneNumber: parsedJson.getIfPresent(key: 'phoneNumber', defaultVal: ''),
    );
  }
}
