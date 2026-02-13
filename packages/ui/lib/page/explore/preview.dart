import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/explore/page.dart';
import 'package:ui/page/explore/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Explore Page', group: 'Page')
Widget previewExplorePage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: ExplorePage(
          state: const ExplorePageState(),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
