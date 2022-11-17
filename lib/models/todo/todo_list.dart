import 'dart:developer';

import './todo_item.dart';

class ToDoList {
  final List<ToDoItem> _todoList = [];

  List<ToDoItem> get todoList => _todoList;

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
}
