import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffFFE81F);
  static const Color secondaryColor = Color(0xFF171421);

  static final lightTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme().apply(
      fontFamily: "Philippa",
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
      circularTrackColor: secondaryColor
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: primaryColor,
      elevation: 0,
    ),
    canvasColor: secondaryColor,
    backgroundColor: secondaryColor,
    scaffoldBackgroundColor: secondaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
  );
}
