import 'package:flutter/material.dart';
import 'package:ui/theme/app_typography.dart';
import 'package:ui/theme/theme.dart';

class AppThemeData {
  AppThemeData({
    required this.colorScheme,
    required this.textTheme,
    TargetPlatform? platform,
  }) {
    themeData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
      useMaterial3: true,
    ).copyWith(
      platform: platform,
      bottomAppBarTheme: colorScheme.bottomAppBarTheme,
    );
  }

  factory AppThemeData.light() {
    return AppThemeData(
      colorScheme: MaterialTheme.lightScheme().toColorScheme(),
      textTheme: const AppTextTheme().black,
    );
  }

  TargetPlatform get platform => themeData.platform;

  late final ThemeData themeData;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
}

extension on ColorScheme {
  BottomAppBarThemeData get bottomAppBarTheme => const BottomAppBarThemeData(
        color: Colors.red,
        elevation: 16,
      );
}
