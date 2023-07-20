import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/main.dart';

class Themes {
  static final light = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColor.whiteColor,
      iconTheme: IconThemeData(
        color: MyApp.isDark ? Colors.white : AppColor.darkGreyColor,
      ),
      actionsIconTheme: IconThemeData(
        color: MyApp.isDark ? Colors.white : AppColor.darkGreyColor,
      ),
      elevation: 0.0,
      titleTextStyle: titleStyle,
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primaryColor,
      onPrimary: AppColor.whiteColor,
      secondary: AppColor.orangeColor,
      onSecondary: AppColor.whiteColor,
      error: Colors.red,
      onError: AppColor.whiteColor,
      background: AppColor.whiteColor,
      onBackground: AppColor.whiteColor,
      surface: AppColor.whiteColor,
      onSurface: AppColor.primaryColor,
    ),
  );

  static final dark = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColor.darkGreyColor,
      iconTheme: IconThemeData(
        color: MyApp.isDark ? Colors.white : AppColor.darkGreyColor,
      ),
      elevation: 0.0,
      titleTextStyle: titleStyle,
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColor.primaryColor,
      onPrimary: AppColor.whiteColor,
      secondary: AppColor.orangeColor,
      onSecondary: AppColor.whiteColor,
      error: Colors.red,
      onError: AppColor.whiteColor,
      background: AppColor.darkGreyColor,
      onBackground: AppColor.whiteColor,
      surface: AppColor.whiteColor,
      onSurface: AppColor.primaryColor,
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
