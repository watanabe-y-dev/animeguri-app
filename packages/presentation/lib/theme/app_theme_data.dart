import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData({
    required this.colorScheme,
    required this.textTheme,
    TargetPlatform? platform,
  }) {
    themeData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(
      platform: platform,
    );
  }

  factory AppThemeData.light() {
    return AppThemeData(
      colorScheme: ColorScheme.light(),
      textTheme: Typography.material2021().black,
    );
  }

  TargetPlatform get platform => themeData.platform;

  late final ThemeData themeData;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
}
