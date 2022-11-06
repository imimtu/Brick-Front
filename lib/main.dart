import 'package:flutter/material.dart';

import 'package:brick/pages/pages.dart';
import 'package:brick/utils/utils.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brick',
      debugShowCheckedModeBanner: false,
      theme: basicTheme,
      home: const HomePage(),
    );
  }
}
