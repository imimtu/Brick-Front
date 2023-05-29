part of brick.styles.theme.dark;

AppBarTheme darkAppbarTheme = AppBarTheme(
  color: Colors.black,
  titleTextStyle: BrickTextStyles.getFont(
    fontType: FontType.titleLarge,
    color: BrickColors.white,
    fontWeightType: FontWeightType.bold,
  ),
  actionsIconTheme: const IconThemeData(
    color: Colors.white,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
