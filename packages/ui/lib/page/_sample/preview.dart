import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:model/_sample/sample.dart';
import 'package:ui/page/_sample/page.dart';
import 'package:ui/page/_sample/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Sample Page', group: 'Page')
Widget previewSamplePage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const SamplePage(
          state: SamplePageState(
            samples: [
              Sample(id: '1', name: 'Sample 1', description: 'Sample 1'),
              Sample(id: '2', name: 'Sample 2', description: 'Sample 2'),
            ],
          ),
        ),
      ),
    ),
  );
}
