import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/reviews/page.dart';
import 'package:ui/page/reviews/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Reviews Page', group: 'Page')
Widget previewReviewsPage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: ReviewsPage(
          state: const ReviewsPageState(),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
