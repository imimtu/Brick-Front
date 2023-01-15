import 'dart:convert';

import 'hashtag.dart';
import 'package:just_util/just_util.dart';

/// Brick(ToDo) Entity
class Brick {
  /// 해당 ToDo의 제목
  String title;

  /// ToDo의 카테고리
  List<HashTag>? hashtags;

  /// 해당 ToDo의 상세 내용
  String? contents;

  /// ToDo의 완료 여부
  late bool isComplete;

  /// Brick 식별 키
  late String _key;

  /// Brick Key Private Getter
  String get key => _key;

  /// Brick 생성일
  late DateTime _createdDate;

  DateTime get createdDate => _createdDate;

  Brick({
    required this.title,
    this.hashtags,
    this.contents,
    this.isComplete = false,
  }) {
    _createdDate = DateTime.now();

    // TODO: Brick 항목별 구분 인자 결정 후 Key 생성 필요
    _key = "";
  }

  /// 얕은 복사함수: 제목, 카테고리, 내용, 완료여부만 복사 진행
  static Brick copy(Brick origin) {
    return Brick(
      title: origin.title,
      hashtags: origin.hashtags,
      contents: origin.contents,
      isComplete: origin.isComplete,
    );
  }

  /// 깊은 복사 함수: 모든 값을 동일하게 복사
  static Brick deepCopy(Brick origin) {
    return Brick(
      title: origin.title,
      hashtags: origin.hashtags,
      contents: origin.contents,
      isComplete: origin.isComplete,
    )
      .._key = origin.key
      .._createdDate = origin.createdDate;
  }

  // TODO(Kangmin): toJson 구현
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json.setIfPresent(key: 'title', val: title);
    json.setIfPresent(key: 'hashtags', val: hashtags, defaultVal: []);
    json.setIfPresent(key: 'contents', val: contents, defaultVal: "");
    json.setIfPresent(key: 'isComplete', val: isComplete);
    json.setIfPresent(key: 'key', val: _key);
    json.setIfPresent(key: 'createdDate', val: _createdDate);

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
