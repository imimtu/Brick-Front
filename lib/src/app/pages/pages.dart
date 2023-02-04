import 'package:flutter/material.dart';

import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/pages/splash/splash.dart';
import 'package:brick/src/app/pages/brick_detail/brick_detail.dart';

export 'home/home.dart';
export 'home/home_controller.dart';
export 'splash/splash.dart';
export 'brick_detail/brick_detail.dart';

enum PATH {
  splash,
  home,
  brickDetail,
}

const Map<PATH, String> path = {
  PATH.splash: "/splash",
  PATH.home: "/",
  PATH.brickDetail: "/brick",
};

Map<String, Widget Function(BuildContext)> routes = {
  path[PATH.splash]!: (context) {
    return const Splash();
  },
  path[PATH.home]!: (context) {
    return const Home();
  },
  path[PATH.brickDetail]!: (context) {
    return const BrickDetail();
  }
};
