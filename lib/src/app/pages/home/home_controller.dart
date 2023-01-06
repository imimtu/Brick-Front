import 'package:flutter/foundation.dart';

import 'package:brick/src/data/models/todo/todo.dart';

class HomeController with ChangeNotifier, DiagnosticableTreeMixin {
  ToDoList toDoList = ToDoList();

  void addItem({required String title, String? contents}) {
    if (title != "") {
      ToDoItem toDoItem = ToDoItem(title: title, contents: contents);
      toDoList.insert(toDoItem);

      notifyListeners();
    }
  }

  void deleteItem({required int index}) {
    toDoList.delete(index);

    notifyListeners();
  }

  void changeComplteState({required int index, required bool val}) {
    toDoList.changeValue(index: index, isComplete: val);

    notifyListeners();
  }
}
