part of brick.styles.theme.basic;

ElevatedButtonThemeData basicElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: BrickColors.black,
    textStyle: BrickTextStyles.getFont(fontType: FontType.bodyMedium).copyWith(
      color: BrickColors.white,
    ),
    padding: const EdgeInsets.all(BrickSize.paddingSide * 2),
  ),
);
