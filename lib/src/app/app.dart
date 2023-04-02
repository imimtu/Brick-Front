import 'package:brick/src/app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:brick/src/app/styles/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brick',
      routes: routes,
      theme: BrickTheme.basic,
      darkTheme: BrickTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
