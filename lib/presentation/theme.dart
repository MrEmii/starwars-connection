import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffFFE81F);
  static const Color secondaryColor = Color(0xFF171421);

  static final lightTheme = ThemeData(
    fontFamily: "Philippa",
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
      circularTrackColor: secondaryColor
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: secondaryColor,
      elevation: 0,
    )
  );
}
