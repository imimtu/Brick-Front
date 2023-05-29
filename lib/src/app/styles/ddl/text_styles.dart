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
  /// Default Font Family
  static const String _fontFamily = 'Noto Sans';

  /// Default TextStyle
  static final TextStyle _textStyle = GoogleFonts.getFont(_fontFamily);

  /// Default Text Theme
  static final TextTheme textTheme = GoogleFonts.getTextTheme(_fontFamily);

  /// FontWeights
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _regular = FontWeight.w400;

  /// Fonts
  // Display
  static final TextStyle _displayLarge = _textStyle.copyWith(
    fontSize: 60,
    fontWeight: _regular,
  );
  static final TextStyle _displayMedium = _textStyle.copyWith(
    fontSize: 56,
    fontWeight: _regular,
  );
  static final TextStyle _displaySmall = _textStyle.copyWith(
    fontSize: 52,
    fontWeight: _regular,
  );

  // headline
  static final TextStyle _headlineLarge = _textStyle.copyWith(
    fontSize: 48,
    fontWeight: _regular,
  );
  static final TextStyle _headlineMedium = _textStyle.copyWith(
    fontSize: 44,
    fontWeight: _regular,
  );
  static final TextStyle _headlineSmall = _textStyle.copyWith(
    fontSize: 40,
    fontWeight: _regular,
  );

  // Title
  static final TextStyle _titleLarge = _textStyle.copyWith(
    fontSize: 36,
    fontWeight: _regular,
  );
  static final TextStyle _titleMedium = _textStyle.copyWith(
    fontSize: 24,
    fontWeight: _regular,
  );
  static final TextStyle _titleSmall = _textStyle.copyWith(
    fontSize: 20,
    fontWeight: _regular,
  );

  // Body
  static final TextStyle _bodyLarge = _textStyle.copyWith(
    fontSize: 18,
    fontWeight: _regular,
  );
  static final TextStyle _bodyMedium = _textStyle.copyWith(
    fontSize: 16,
    fontWeight: _regular,
  );
  static final TextStyle _bodySmall = _textStyle.copyWith(
    fontSize: 14,
    fontWeight: _regular,
  );

  // Label
  static final TextStyle _labelLarge = _textStyle.copyWith(
    fontSize: 12,
    fontWeight: _regular,
  );
  static final TextStyle _labelMedium = _textStyle.copyWith(
    fontSize: 10,
    fontWeight: _regular,
  );
  static final TextStyle _labelSmall = _textStyle.copyWith(
    fontSize: 8,
    fontWeight: _regular,
  );

  /// Custom Text Theme
  static TextTheme theme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
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
