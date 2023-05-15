import 'dart:convert';

import '../../hashtag/repositories/hashtag.dart';
import 'package:just_util/just_util.dart';

/// Brick(ToDo) Entity
class Brick {
  /// 해당 ToDo의 제목
  String title;

  /// ToDo의 카테고리
  List<String>? hashtags;

  /// 해당 ToDo의 상세 내용
  String? content;

  /// ToDo의 완료 여부
  late bool isCompleted;

  int priority;

  /// Brick 식별 키
  late String _key;

  /// Brick Key Private Getter
  String get key => _key;

  /// Brick 생성일
  late DateTime _createdAt;

  /// 생성자 (UserID)
  late String _createdBy;

  Brick({
    required this.title,
    this.hashtags,
    this.content,
    this.isCompleted = false,
    this.priority = 3,
  }) {
    _createdAt = DateTime.now();

    // TODO: Brick 항목별 구분 인자 결정 후 Key 생성 필요
    _key = "";
  }

  /// 얕은 복사함수: 제목, 카테고리, 내용, 완료여부만 복사 진행
  factory Brick.copy(Brick origin) {
    return Brick(
      title: origin.title,
      hashtags: origin.hashtags,
      content: origin.content,
      isCompleted: origin.isCompleted,
    );
  }

  /// 깊은 복사 함수: 모든 값을 동일하게 복사
  factory Brick.deepCopy(Brick origin) {
    return Brick(
      title: origin.title,
      hashtags: origin.hashtags,
      content: origin.content,
      isCompleted: origin.isCompleted,
    )
      .._key = origin.key
      .._createdAt = origin._createdAt;
  }

  // TODO(Kangmin): toJson 구현
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json.setIfPresent(key: 'title', val: title);
    json.setIfPresent(key: 'hashtags', val: hashtags, defaultVal: []);
    json.setIfPresent(key: 'content', val: content, defaultVal: "");
    json.setIfPresent(key: 'isCompleted', val: isCompleted);
    json.setIfPresent(key: 'key', val: _key);
    json.setIfPresent(key: 'createdAt', val: _createdAt);

    return json;
  }

  // TODO(Kangmin): fromJson 구현
  static Brick fromJson(json) {
    if (json is String) {
      json = jsonDecode(json);
    }

    return Brick(title: json['title']);
  }
}
