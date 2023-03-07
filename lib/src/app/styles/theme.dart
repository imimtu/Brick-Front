import 'package:flutter/material.dart';

/// Bric Default Theme
ThemeData basicTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);

/// Bric Dark Theme
ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
);
