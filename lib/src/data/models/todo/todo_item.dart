import './todo_catergory.dart';

class ToDoItem {
  /// 해당 ToDo의 제목
  String title;

  /// ToDo의 카테고리
  List<ToDoCategory>? category;

  /// 해당 ToDo의 상세 내용
  String? contents;

  /// ToDo의 완료 여부
  bool isComplete = false;

  // TODO: ToDo 항목별 구분 인자 결정 후 Key 생성 필요
  /// ToDo의 식별 키
  late String _key;

  /// ToDo의 Key Private Getter
  String get _getKey => _key;

  /// ToDo 생성일
  late DateTime _createdDate;

  DateTime get _getCreatedDate => _createdDate;

  ToDoItem({
    required this.title,
    this.category,
    this.contents,
  }) {
    _createdDate = DateTime.now();
    _key = "";
  }

  /// ToDo Item 얕은 복사함수
  ///
  /// 제목, 카테고리, 내용만 복사 진행
  static ToDoItem copy(ToDoItem origin) {
    return ToDoItem(
      title: origin.title,
      category: origin.category,
      contents: origin.contents,
    )
      .._key = origin._getKey
      .._createdDate = origin._getCreatedDate;
  }

  /// ToDo Item 깊은 복사 함수
  ///
  /// 모든 값을 동일하게 복사
  static ToDoItem deepCopy(ToDoItem origin) {
    return ToDoItem(
      title: origin.title,
      category: origin.category,
      contents: origin.contents,
    )
      .._key = origin._getKey
      .._createdDate = origin._getCreatedDate;
  }

  // TODO(Kangmin): 로컬 디비에 읽기 및 쓰기
}
