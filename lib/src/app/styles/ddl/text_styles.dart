part of brick.styles.ddl;

enum FontType {
  displayLarge,
  displayMedium,
  displaySmall,

  headlineLarge,
  headlineMedium,
  headlineSmall,

  titleLarge,
  titleMedium,
  titleSmall,

  bodyLarge,
  bodyMedium,
  bodySmall,

  labelLarge,
  labelMedium,
  labelSmall,
}

enum FontWeightType {
  bold,
  medium,
  regular,
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
  // Display
  static const TextStyle _displayLarge = TextStyle(
    fontSize: 60,
    fontWeight: _regular,
  );
  static const TextStyle _displayMedium = TextStyle(
    fontSize: 56,
    fontWeight: _regular,
  );
  static const TextStyle _displaySmall = TextStyle(
    fontSize: 52,
    fontWeight: _regular,
  );

  // Display
  static const TextStyle _headlineLarge = TextStyle(
    fontSize: 48,
    fontWeight: _regular,
  );
  static const TextStyle _headlineMedium = TextStyle(
    fontSize: 44,
    fontWeight: _regular,
  );
  static const TextStyle _headlineSmall = TextStyle(
    fontSize: 40,
    fontWeight: _regular,
  );

  // Title
  static const TextStyle _titleLarge = TextStyle(
    fontSize: 36,
    fontWeight: _regular,
  );
  static const TextStyle _titleMedium = TextStyle(
    fontSize: 24,
    fontWeight: _regular,
  );
  static const TextStyle _titleSmall = TextStyle(
    fontSize: 20,
    fontWeight: _regular,
  );

  // Body
  static const TextStyle _bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: _regular,
  );
  static const TextStyle _bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: _regular,
  );
  static const TextStyle _bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: _regular,
  );

  // Label
  static const TextStyle _labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: _regular,
  );
  static const TextStyle _labelMedium = TextStyle(
    fontSize: 10,
    fontWeight: _regular,
  );
  static const TextStyle _labelSmall = TextStyle(
    fontSize: 8,
    fontWeight: _regular,
  );

  static TextStyle _fontTypeTranslator({required FontType fontType}) {
    TextStyle style = const TextStyle();

    switch (fontType) {
      case FontType.displayLarge:
        style = _displayLarge;
        break;
      case FontType.displayMedium:
        style = _displayMedium;
        break;
      case FontType.displaySmall:
        style = _displaySmall;
        break;
      case FontType.headlineLarge:
        style = _headlineLarge;
        break;
      case FontType.headlineMedium:
        style = _headlineMedium;
        break;
      case FontType.headlineSmall:
        style = _headlineSmall;
        break;
      case FontType.titleLarge:
        style = _titleLarge;
        break;
      case FontType.titleMedium:
        style = _titleMedium;
        break;
      case FontType.titleSmall:
        style = _titleSmall;
        break;
      case FontType.bodyLarge:
        style = _bodyLarge;
        break;
      case FontType.bodyMedium:
        style = _bodyMedium;
        break;
      case FontType.bodySmall:
        style = _bodySmall;
        break;
      case FontType.labelLarge:
        style = _labelLarge;
        break;
      case FontType.labelMedium:
        style = _labelMedium;
        break;
      case FontType.labelSmall:
        style = _labelSmall;
        break;
    }

    return style;
  }

  static FontWeight _fontWeightTransLator({
    required FontWeightType fontWeightType,
  }) {
    FontWeight fontWeight = _regular;

    switch (fontWeightType) {
      case FontWeightType.bold:
        fontWeight = _bold;
        break;
      case FontWeightType.medium:
        fontWeight = _medium;
        break;
      case FontWeightType.regular:
        fontWeight = _regular;
        break;
    }

    return fontWeight;
  }

  static TextStyle getFont({
    required FontType fontType,
    FontWeightType? fontWeightType,
    Color? color,
  }) {
    TextStyle result = _fontTypeTranslator(fontType: fontType).copyWith(
      color: color,
    );

    if (fontWeightType != null) {
      result.copyWith(
          fontWeight: _fontWeightTransLator(
        fontWeightType: fontWeightType,
      ));
    }

    return result;
  }
}
