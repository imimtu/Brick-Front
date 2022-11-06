import 'package:brick/pages/splash_page.dart';
import 'package:flutter/material.dart';

export 'home_page.dart';
export 'splash_page.dart';

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
    return const SplashPage();
  },
  path[PATH.home]!: (context) {
    return const SizedBox();
  },
};
