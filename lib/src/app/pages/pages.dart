import 'package:brick/src/app/pages/login/login.dart';
import 'package:brick/src/app/pages/signup/signup.dart';
import 'package:flutter/material.dart';

import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/pages/splash/splash.dart';
import 'package:brick/src/app/pages/brick_detail/brick_detail.dart';

export 'home/home.dart';
export '../providers/brick_provider.dart';
export 'splash/splash.dart';
export 'brick_detail/brick_detail.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Splash.path: (context) {
    return const Splash();
  },
  Login.path: (context) {
    return const Login();
  },
  SignUp.path: (context) {
    return const SignUp();
  },
  Home.path: (context) {
    return const Home();
  },
  BrickDetail.path: (context) {
    return const BrickDetail();
  }
};
