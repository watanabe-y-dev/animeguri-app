import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/spot_detail/page.dart';
import 'package:ui/page/spot_detail/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Spot Detail Page', group: 'Page')
Widget previewSpotDetailPage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: SpotDetailPage(
          state: const SpotDetailPageState(),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
