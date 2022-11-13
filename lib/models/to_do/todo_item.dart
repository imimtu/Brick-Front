import './todo_catergory.dart';

class ToDoItem {
  final String title;

  List<ToDoCategory>? category;

  /// 해당 ToDo의 상세 내용
  String? contents;

  late DateTime createdDate;

  ToDoItem({
    required this.title,
    this.category,
    this.contents,
  }) {
    createdDate = DateTime.now();
  }

  // TODO(Kangmin): 로컬 디비에 읽기 및 쓰기
}
