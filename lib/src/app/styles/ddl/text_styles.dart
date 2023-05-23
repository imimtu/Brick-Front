part of brick.styles.ddl;

enum FontType {
  title,
  body,
  sub,
}

/// Brick TextStyles
abstract class BrickTextStyles {
  /// FontTheme
  static const TextTheme basicTextTheme = Typography.blackCupertino;
  static const TextTheme darkTextTheme = Typography.whiteCupertino;

  /// FontWeights
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _regular = FontWeight.w400;

  /// Fonts
  static const TextStyle _title = TextStyle(
    fontSize: 24,
    fontWeight: _regular,
  );

  static const TextStyle _body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle _sub = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle _fontTypeTranslator({required FontType fontType}) {
    TextStyle style = const TextStyle();

    switch (fontType) {
      case FontType.title:
        style = _title;
        break;
      case FontType.body:
        style = _body;
        break;
      case FontType.sub:
        style = _sub;
        break;
    }

    return style;
  }

  static TextStyle getFont({required FontType fontType, Color? color}) {
    return _fontTypeTranslator(fontType: fontType).copyWith(
      color: color,
    );
  }
}
