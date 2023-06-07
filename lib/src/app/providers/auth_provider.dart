import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogined = false;

  Future login() async {
    isLogined = true;

    notifyListeners();
  }

  Future logout() async {
    isLogined = false;

    notifyListeners();
  }

  Future signUp({
    required String userId,
    required String userPassword,
  }) async {}
}
