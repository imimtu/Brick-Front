import 'package:brick/src/util/brick_logger.dart';
import 'package:flutter/material.dart';

/// Brick's theme.
class BrickTheme {
  // ----------------------------------------
  // Singleton
  // ----------------------------------------

  /// Singleton instance
  static final BrickTheme _instance = BrickTheme._privateConstructor();

  /// Define private constructor
  BrickTheme._privateConstructor() {
    BrickLogger().info(
      msg: 'BrickTheme Constructed!',
      block: 'SingleTonConstructor/BrickTheme',
    );
  }

  /// Default constructor. Always return same instance.
  factory BrickTheme() {
    return _instance;
  }

  // ----------------------------------------
  // Themes
  // ----------------------------------------

  /// Brick default theme
  ThemeData basic = ThemeData(
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

  /// Brick dark theme
  ThemeData dark = ThemeData(
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
}
