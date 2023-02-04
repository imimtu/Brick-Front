import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:brick/src/app/app.dart';
import 'package:brick/src/app/pages/home/home_controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HomeController())),
    ],
    child: const App(),
  ));
}
