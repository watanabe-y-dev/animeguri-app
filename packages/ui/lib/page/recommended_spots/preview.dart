import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/spot_list_item/spot_list_item.dart';
import 'package:ui/page/recommended_spots/page.dart';
import 'package:ui/page/recommended_spots/viewmodel.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Recommended Spots Page', group: 'Page')
Widget previewRecommendedSpotsPage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: RecommendedSpotsPage(
          state: const RecommendedSpotsPageState(
            spots: [
              SpotItem(
                id: '1',
                spotName: '河口湖大橋',
                animeName: 'ゆるキャン△',
                imageUrl: '',
                badge: SpotBadgeType.newSpot,
              ),
              SpotItem(
                id: '2',
                spotName: '湯涌温泉',
                animeName: '花咲くいろは',
                imageUrl: '',
                badge: SpotBadgeType.trending,
              ),
              SpotItem(
                id: '3',
                spotName: '秩父橋',
                animeName: 'あの花',
                imageUrl: '',
                badge: SpotBadgeType.popular,
              ),
            ],
            filterChips: [
              FilterChipItem(label: 'すべて'),
              FilterChipItem(label: '新着'),
              FilterChipItem(label: '話題'),
              FilterChipItem(label: '人気'),
              FilterChipItem(label: '関東'),
            ],
            selectedFilterIndex: 0,
            totalCount: 24,
            sortLabel: 'おすすめ順',
          ),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
