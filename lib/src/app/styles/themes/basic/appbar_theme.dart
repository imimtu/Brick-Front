part of brick.styles.theme.basic;

AppBarTheme basicAppbarTheme = AppBarTheme(
  color: BrickColors.white,
  titleTextStyle: BrickTextStyles.getFont(
    fontType: FontType.titleLarge,
    color: BrickColors.black,
    fontWeightType: FontWeightType.bold,
  ),
  actionsIconTheme: const IconThemeData(
    color: Colors.black,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);
