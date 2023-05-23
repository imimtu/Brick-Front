library brick.styles.theme.dark;

import 'package:brick/src/app/styles/ddl/ddl.dart';
import 'package:flutter/material.dart';

part 'appbar_theme.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: BrickColors.black,
  ),
  textTheme: BrickTextStyles.darkTextTheme,
);
