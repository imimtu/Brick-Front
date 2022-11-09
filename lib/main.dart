// Distinguish Platform : https://stackoverflow.com/a/50744481
// import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:brick/pages/pages.dart';
import 'package:brick/utils/utils.dart';

void main() {
  if (kIsWeb) {
    runApp(const WebApp());
  } else {
    runApp(const MobileApp());
  }
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

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

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brick Web',
      debugShowCheckedModeBanner: false,
      theme: basicTheme,
      home: const HomePage(),
    );
  }
}
