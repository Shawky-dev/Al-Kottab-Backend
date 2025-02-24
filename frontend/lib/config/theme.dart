import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    fontFamily: 'NotoKufiArabic', 
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.w900),
      displayMedium: TextStyle(fontWeight: FontWeight.w800),
      displaySmall: TextStyle(fontWeight: FontWeight.w700),
      headlineLarge: TextStyle(fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontWeight: FontWeight.w300),
      labelLarge: TextStyle(fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontWeight: FontWeight.w400),
      labelSmall: TextStyle(fontWeight: FontWeight.w300),
    ),
  );
}
