import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/explore/component/trending_anime_section/trending_anime_section.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Trending Anime Section', group: 'Section')
Widget previewTrendingAnimeSection() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: AppTheme(
            theme: theme,
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: TrendingAnimeSection(),
            ),
          ),
        );
      },
    ),
  );
}
