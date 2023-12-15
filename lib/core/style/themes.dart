import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/main.dart';

class Themes {
  static final light = ThemeData(
    appBarTheme: AppBarTheme(
      color: LightColor.backgroundColor,
      iconTheme: const IconThemeData(
        color: LightColor.onBackgroundColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: LightColor.onBackgroundColor,
      ),
      elevation: 0.0,
      titleTextStyle: titleStyle,
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: LightColor.primaryColor,
      onPrimary: LightColor.onBackgroundColor,
      secondary: LightColor.secondaryColor,
      onSecondary: LightColor.onBackgroundColor,
      error: LightColor.errorColor,
      onError: LightColor.onBackgroundColor,
      background: LightColor.backgroundColor,
      onBackground: LightColor.onBackgroundColor,
      surface: LightColor.backgroundColor,
      onSurface: LightColor.onBackgroundColor,
    ),
  );

  static final dark = ThemeData(
    appBarTheme: AppBarTheme(
      color: DarkColor.backgroundColor,
      iconTheme: const IconThemeData(
        color: DarkColor.onBackgroundColor
      ),
      elevation: 0.0,
      titleTextStyle: titleStyle,
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: DarkColor.primaryColor,
      onPrimary: DarkColor.onPrimaryColor,
      secondary: DarkColor.secondaryColor,
      onSecondary: DarkColor.onPrimaryColor,
      error: DarkColor.errorColor,
      onError: DarkColor.onPrimaryColor,
      background: DarkColor.backgroundColor,
      onBackground: DarkColor.onBackgroundColor,
      surface: DarkColor.backgroundColor,
      onSurface: DarkColor.onBackgroundColor,
    ),
  );

  static TextStyle get headingStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: MyApp.isDark ? Colors.white : Colors.black,
        ),
      );
  static TextStyle get subHeadingStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: MyApp.isDark ? Colors.white : Colors.black,
        ),
      );
  static TextStyle get titleStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MyApp.isDark ? Colors.white : Colors.black,
        ),
      );

  static TextStyle get subTitleStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: MyApp.isDark ? Colors.white : Colors.black,
        ),
      );

  static TextStyle get bodyStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: MyApp.isDark ? Colors.white : Colors.black,
        ),
      );

  static TextStyle get body2Style => GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: MyApp.isDark ? Colors.grey : Colors.black,
        ),
      );
}
