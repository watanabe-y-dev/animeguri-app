import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/anime_detail/page.dart';
import 'package:ui/page/anime_detail/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Anime Detail Page', group: 'Page')
Widget previewAnimeDetailPage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: AnimeDetailPage(
          state: const AnimeDetailPageState(),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
