import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/anime_card/anime_card.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Trending Anime Card', group: 'Component')
Widget previewAnimeCard() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      backgroundColor: theme.themeData.colorScheme.surface,
      body: AppTheme(
        theme: theme,
        child: const Center(
          child: AnimeCard(
            imageUrl: 'https://picsum.photos/140/90',
            title: 'ぼっち・ざ・ろっく！',
            spotCount: 12,
          ),
        ),
      ),
    ),
  );
}
