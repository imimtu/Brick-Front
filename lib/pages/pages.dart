import 'package:flutter/material.dart';

import 'package:brick/pages/home/home.dart';
import 'package:brick/pages/splash/splash.dart';
import 'package:brick/pages/todo/todo.dart';

export 'home/home.dart';
export 'home/home_controller.dart';
export 'splash/splash.dart';
export 'todo/todo.dart';

enum PATH {
  splash,
  home,
  todo,
}

const Map<PATH, String> path = {
  PATH.splash: "/splash",
  PATH.home: "/",
  PATH.todo: "/todo",
};

Map<String, Widget Function(BuildContext)> routes = {
  path[PATH.splash]!: (context) {
    return const Splash();
  },
  path[PATH.home]!: (context) {
    return const Home();
  },
  path[PATH.todo]!: (context) {
    return const ToDo();
  }
};
