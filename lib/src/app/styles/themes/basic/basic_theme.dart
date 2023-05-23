library brick.styles.theme.basic;

import 'package:brick/src/app/styles/ddl/ddl.dart';
import 'package:flutter/material.dart';

part 'appbar_theme.dart';
part 'elevated_button_theme.dart';

ThemeData basicTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: BrickColors.white,
  ),
  textTheme: BrickTextStyles.basicTextTheme,
);
