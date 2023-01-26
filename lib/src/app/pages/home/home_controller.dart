import 'package:flutter/foundation.dart';

import 'package:brick/src/domain/models/brick.dart';

class HomeController with ChangeNotifier, DiagnosticableTreeMixin {
  List<Brick> brickList = [];

  void addItem({required String title, String? contents}) {
    if (title != "") {
      Brick brick = Brick(title: title, contents: contents);
      brickList.add(brick);
      notifyListeners();
    }
  }

  void deleteItem({required int index}) {
    brickList.removeAt(index);
    notifyListeners();
  }

  void changeComplteState({required int index, required bool val}) {
    brickList[index].isComplete = val;
    notifyListeners();
  }
}
