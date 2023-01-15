import 'dart:convert';

import 'package:just_util/just_util.dart';

class HashTag {
  /// HashTag의 텍스트 값
  String title;

  /// HashTag 식별 키
  late String _key;

  /// HashTag Key Private Getter
  String get key => _key;

  DateTime? _createdDate;

  DateTime? get createdDate => _createdDate;

  HashTag({
    required this.title,
  }) {
    _createdDate = DateTime.now();

    // TODO: HashTag 항목별 구분 인자 결정 후 Key 생성 필요
    _key = "";
  }

  /// 얕은 복사 함수: key를 제외한 값을 동일하게 복사
  static HashTag copy(HashTag origin) {
    return HashTag(
      title: origin.title,
    );
  }

  /// 깊은 복사 함수: 모든 값을 동일하게 복사
  static HashTag deepCopy(HashTag origin) {
    return HashTag(
      title: origin.title,
    ).._key = origin.key;
  }

  // TODO(Kangmin): toJson 구현
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json.setIfPresent(key: 'title', val: title);
    json.setIfPresent(key: 'key', val: _key);
    json.setIfPresent(key: 'createdDate', val: _createdDate);

    return json;
  }

  // TODO(Kangmin): fromJson 구현
  static HashTag fromJson(json) {
    if (json is String) {
      json = jsonDecode(json);
    }

    return HashTag(title: json['title']);
  }
}
