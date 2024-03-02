import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:careeria/core/utils/pref_utils.dart';
import 'package:careeria/core/utils/size_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return appTheme.whiteA700;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 13.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray600,
          fontSize: 12.fSize,
          fontFamily: 'Be Vietnam',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 36.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 32.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Be Vietnam',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 8.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Be Vietnam',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF5093B8),

    // On colors(text colors)
    onPrimary: Color(0XFF262626),
    onPrimaryContainer: Color(0XFFD9D9D9),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amberA200 => Color(0XFFF5CD3F);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue400 => Color(0XFF4AB0E8);
  Color get blue500 => Color(0XFF2EA5E7);
  Color get blueA400 => Color(0XFF1877F2);

  // BlueGray
  Color get blueGray50 => Color(0XFFEDF3F9);
  Color get blueGray600 => Color(0XFF596C87);
  Color get blueGray700 => Color(0XFF354C6B);
  Color get blueGray800 => Color(0XFF273F5F);
  Color get blueGray900 => Color(0XFF2D2D2D);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFEEEEEE);
  Color get gray400 => Color(0XFFC9C9C9);
  Color get gray50 => Color(0XFFF6F9FE);
  Color get gray500 => Color(0XFF979797);
  Color get gray600 => Color(0XFF6B6B6B);
  Color get gray60028 => Color(0X28787880);
  Color get gray700 => Color(0XFF615C5C);

  // Green
  Color get green500 => Color(0XFF34C759);
  Color get green600 => Color(0XFF2C9169);

  // Indigo
  Color get indigo50 => Color(0XFFE5EFF4);

  // LightBlue
  Color get lightBlue800 => Color(0XFF0076B2);

  // LightGreen
  Color get lightGreen900 => Color(0XFF387921);
  Color get lightGreenA700 => Color(0XFF5BD132);

  // Red
  Color get redA700 => Color(0XFFFF0909);

  // Teal
  Color get teal100 => Color(0XFFA7C9DB);
  Color get teal200 => Color(0XFF85B3CD);
  Color get teal300 => Color(0XFF5B9FC0);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Yellow
  Color get yellowA200 => Color(0XFFFAFF08);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();