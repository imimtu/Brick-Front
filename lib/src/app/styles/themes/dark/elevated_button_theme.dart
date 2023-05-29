part of brick.styles.theme.dark;

ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: BrickColors.white,
    textStyle: BrickTextStyles.getFont(fontType: FontType.bodyMedium).copyWith(
      color: BrickColors.black,
    ),
    padding: const EdgeInsets.all(BrickSize.paddingSide * 2),
  ),
);
