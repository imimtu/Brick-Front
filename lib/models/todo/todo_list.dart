import 'dart:developer';

import 'package:brick/models/todo/todo_catergory.dart';

import './todo_item.dart';

class ToDoList {
  final List<ToDoItem> _todoList = [];

  List<ToDoItem> get todoList => _todoList;

  int get length => _todoList.length;

  ToDoItem itemAt(int index) {
    return _todoList[index];
  }

  /// ToDo Item 추가
  void insert(ToDoItem toDoItem) {
    _todoList.add(toDoItem);
  }

  /// 특정 위치에 ToDo Item 추가
  void delete(int index) {
    if (_todoList.length > index) {
      _todoList.removeAt(index);
    } else {
      log(
        "'index' must be smaller than todoList's length.",
        stackTrace: StackTrace.current,
      );
    }
  }

  void changeValue({
    required int index,
    String? title,
    List<ToDoCategory>? category,
    String? contents,
    bool? isComplete,
  }) {
    if (title != null) todoList[index].title = title;
    if (category != null) todoList[index].category = category;
    if (contents != null) todoList[index].contents = contents;
    if (isComplete != null) todoList[index].isComplete = isComplete;
  }
}
