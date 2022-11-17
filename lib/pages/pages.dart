import 'package:flutter/material.dart';

import 'package:brick/pages/home/home.dart';
import 'package:brick/pages/splash/splash.dart';

export 'home/home.dart';
export 'splash/splash.dart';

enum PATH {
  splash,
  home,
}

const Map<PATH, String> path = {
  PATH.splash: "/splash",
  PATH.home: "/",
};

Map<String, Widget Function(BuildContext)> routes = {
  path[PATH.splash]!: (context) {
    return const Splash();
  },
  path[PATH.home]!: (context) {
    return const Home();
  },
};
