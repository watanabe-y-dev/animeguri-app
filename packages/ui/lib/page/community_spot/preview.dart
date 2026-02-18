import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/page/community_spot/page.dart';
import 'package:ui/page/community_spot/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Community Spot Page', group: 'Page')
Widget previewCommunitySpotPage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const CommunitySpotPage(
          state: CommunitySpotPageState(
            posts: mockCommunitySpotPosts,
            selectedFilter: CommunitySpotFilter.all,
          ),
          onEvent: _noOp,
        ),
      ),
    ),
  );
}

void _noOp(CommunitySpotPageEvent event) {}
