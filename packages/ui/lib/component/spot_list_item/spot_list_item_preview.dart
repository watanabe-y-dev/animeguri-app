import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/spot_list_item/spot_list_item.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'SpotListItem - 新着', group: 'Component')
Widget previewSpotListItemNew() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpotListItem(
              spotName: '須賀神社の階段',
              animeName: '君の名は。',
              imageUrl: '',
              badge: SpotBadgeType.newSpot,
            ),
            SpotListItem(
              spotName: '竹下通り',
              animeName: 'ソードアート・オンライン',
              imageUrl: '',
              badge: SpotBadgeType.trending,
            ),
            SpotListItem(
              spotName: '鎌倉高校前駅の踏切',
              animeName: 'スラムダンク',
              imageUrl: '',
              badge: SpotBadgeType.popular,
            ),
            SpotListItem(
              spotName: '秋葉原電気街',
              animeName: 'シュタインズ・ゲート',
              imageUrl: '',
            ),
          ],
        ),
      ),
    ),
  );
}
