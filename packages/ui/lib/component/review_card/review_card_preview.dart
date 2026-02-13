import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/review_card/review_card.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'ReviewCard', group: 'Component')
Widget previewReviewCard() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      backgroundColor: theme.themeData.colorScheme.surface,
      body: AppTheme(
        theme: theme,
        child: const Center(
          child: ReviewCard(
            avatarUrl: 'https://i.pravatar.cc/64?img=3',
            userName: 'あおい',
            timeAgo: '2時間前',
            rating: 4,
            comment: '聖地巡礼で訪れました！アニメの雰囲気そのままで感動しました。',
            spotName: '須賀神社',
            animeName: '君の名は。',
          ),
        ),
      ),
    ),
  );
}

@Preview(name: 'ReviewCard - Full Stars', group: 'Component')
Widget previewReviewCardFullStars() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      backgroundColor: theme.themeData.colorScheme.surface,
      body: AppTheme(
        theme: theme,
        child: const Center(
          child: ReviewCard(
            avatarUrl: 'https://i.pravatar.cc/64?img=5',
            userName: 'たくや',
            timeAgo: '1日前',
            rating: 5,
            comment: '最高の場所でした！写真スポットもたくさんあって、ファンにはたまりません。',
            spotName: '竹下通り',
            animeName: 'ラブライブ！',
          ),
        ),
      ),
    ),
  );
}
