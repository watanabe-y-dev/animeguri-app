import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/search_bar/search_bar.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Search Bar', group: 'Component')
Widget previewSearchBar() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: AppSearchBar(),
        ),
      ),
    ),
  );
}
