import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/ranking_list_item/ranking_list_item.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'RankingListItem', group: 'Component')
Widget previewRankingListItem() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RankingListItem(
              rank: 1,
              title: '須賀神社',
              subtitle: '君の名は。',
              count: 1234,
              unit: '訪問',
            ),
            RankingListItem(
              rank: 2,
              title: '豊郷小学校旧校舎群',
              subtitle: 'けいおん!',
              count: 987,
              unit: '訪問',
            ),
            RankingListItem(
              rank: 3,
              title: '飛騨古川駅',
              subtitle: '君の名は。',
              count: 856,
              unit: '訪問',
            ),
            RankingListItem(
              rank: 4,
              title: '江の島',
              subtitle: 'TARI TARI',
              count: 543,
              unit: '訪問',
            ),
            RankingListItem(
              rank: 5,
              title: '大洗磯前神社',
              subtitle: 'ガールズ&パンツァー',
              count: 421,
              unit: '訪問',
            ),
          ],
        ),
      ),
    ),
  );
}
