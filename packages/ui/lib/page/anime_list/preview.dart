import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/anime_list/page.dart';
import 'package:ui/page/anime_list/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Anime List Page', group: 'Page')
Widget previewAnimeListPage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const AnimeListPage(
          state: AnimeListPageState(),
          onEvent: _noOp,
        ),
      ),
    ),
  );
}

void _noOp(AnimeListPageEvent event) {}
