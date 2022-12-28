import 'package:flutter/material.dart';
import 'package:brick/src/app/pages/pages.dart';
import 'package:brick/src/app/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HomeController())),
    ],
    child: const App(),
  ));
}
