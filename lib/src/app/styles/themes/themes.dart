library brick.styles.theme;

import 'package:brick/src/app/styles/themes/basic/basic_theme.dart';
import 'package:brick/src/app/styles/themes/dark/dark_theme.dart';

import 'package:flutter/material.dart';

/// Brick's theme.
abstract class BrickTheme {
  /// Brick default theme
  static ThemeData basic = basicTheme;

  /// Brick dark theme
  static ThemeData dark = darkTheme;
}
