import 'package:flutter/material.dart';

import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/pages/splash/splash.dart';
import 'package:brick/src/app/pages/brick_detail/brick_detail.dart';

export 'home/home.dart';
export 'home/home_controller.dart';
export 'splash/splash.dart';
export 'brick_detail/brick_detail.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Splash.path: (context) {
    return const Splash();
  },
  Home.path: (context) {
    return const Home();
  },
  BrickDetail.path: (context) {
    return const BrickDetail();
  }
};
