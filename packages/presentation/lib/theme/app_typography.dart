import 'package:flutter/material.dart';

class AppTextTheme {
  const AppTextTheme();

  TextTheme get black => const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 57,
      letterSpacing: -0.25,
      height: 64/57,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 45,
      letterSpacing: 0,
      height: 52/45,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 36,
      letterSpacing: 0,
      height: 44/36,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 32,
      letterSpacing: 0,
      height: 40/32,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      letterSpacing: 0,
      height: 36/28,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      letterSpacing: 0,
      height: 32/24,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      letterSpacing: 0,
      height: 28/22,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.15,
      height: 24/16,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.1,
      height: 20/14,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      letterSpacing: 0.5,
      height: 1.15,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: 0.25,
      height: 1.15,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.4,
      height: 1.15,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      letterSpacing: 0.1,
      height: 1.15,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.5,
      height: 1.15,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.5,
      height: 1.15,
    ),
  );
}
