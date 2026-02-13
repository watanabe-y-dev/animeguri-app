import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/anime_badge/anime_badge.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'AnimeBadge', group: 'Component')
Widget previewAnimeBadge() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AnimeBadge(name: 'ぼっち・ざ・ろっく！', count: 12),
              AnimeBadge(name: 'ラブライブ！', count: 42),
              AnimeBadge(name: '鬼滅の刃', count: 7),
            ],
          ),
        ),
      ),
    ),
  );
}
