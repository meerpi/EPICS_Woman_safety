import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kThemeModeKey = '__theme_mode__';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  ThemeTypography get typography => ThemeTypography(this);

  Color get primary => primaryColor;
  Color get secondary => secondaryColor;
  Color get tertiary => tertiaryColor;
}

class LightModeTheme extends FlutterFlowTheme {
  @override
  late Color primaryColor = const Color(0xFF6A1B9A);
  @override
  late Color secondaryColor = const Color(0xFF9C27B0);
  @override
  late Color tertiaryColor = const Color(0xFF059669);
  @override
  late Color alternate = const Color(0xFFE0E0E0);
  @override
  late Color primaryText = const Color(0xFF1F2937);
  @override
  late Color secondaryText = const Color(0xFF6B7280);
  @override
  late Color primaryBackground = const Color(0xFFF3F4F6);
  @override
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  @override
  late Color accent1 = const Color(0xFFE1BEE7);
  @override
  late Color accent2 = const Color(0xFFF3E5F5);
  @override
  late Color accent3 = const Color(0xFFCE93D8);
  @override
  late Color accent4 = const Color(0xFFBA68C8);
  @override
  late Color success = const Color(0xFF4CAF50);
  @override
  late Color warning = const Color(0xFFF59E0B);
  @override
  late Color error = const Color(0xFFDC2626);
  @override
  late Color info = const Color(0xFFFFFFFF);
}

class DarkModeTheme extends FlutterFlowTheme {
  @override
  late Color primaryColor = const Color(0xFF9C27B0);
  @override
  late Color secondaryColor = const Color(0xFFBA68C8);
  @override
  late Color tertiaryColor = const Color(0xFF10B981);
  @override
  late Color alternate = const Color(0xFF424242);
  @override
  late Color primaryText = const Color(0xFFFFFFFF);
  @override
  late Color secondaryText = const Color(0xFF9CA3AF);
  @override
  late Color primaryBackground = const Color(0xFF1F2937);
  @override
  late Color secondaryBackground = const Color(0xFF374151);
  @override
  late Color accent1 = const Color(0xFF7B1FA2);
  @override
  late Color accent2 = const Color(0xFF6A1B9A);
  @override
  late Color accent3 = const Color(0xFFAB47BC);
  @override
  late Color accent4 = const Color(0xFF8E24AA);
  @override
  late Color success = const Color(0xFF66BB6A);
  @override
  late Color warning = const Color(0xFFFFA726);
  @override
  late Color error = const Color(0xFFEF5350);
  @override
  late Color info = const Color(0xFF000000);
}

class ThemeTypography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter Tight';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Inter Tight';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Inter Tight';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter Tight';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter Tight';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Inter Tight';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter Tight';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Inter Tight';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter Tight';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Inter';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Inter';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => 'Inter';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Inter';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );

  String get title1Family => displaySmallFamily;
  TextStyle get title1 => displaySmall;
  String get title2Family => headlineMediumFamily;
  TextStyle get title2 => headlineMedium;
  String get title3Family => headlineSmallFamily;
  TextStyle get title3 => headlineSmall;
  String get subtitle1Family => titleLargeFamily;
  TextStyle get subtitle1 => titleLarge;
  String get subtitle2Family => titleMediumFamily;
  TextStyle get subtitle2 => titleMedium;
  String get bodyText1Family => bodyLargeFamily;
  TextStyle get bodyText1 => bodyLarge;
  String get bodyText2Family => bodyMediumFamily;
  TextStyle get bodyText2 => bodyMedium;
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    TextStyle? font,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) {
    if (font != null) {
      return font.copyWith(
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
    }
    if (useGoogleFonts && fontFamily != null) {
      return GoogleFonts.getFont(
        fontFamily,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
    }
    return copyWith(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      height: lineHeight,
    );
  }
}
