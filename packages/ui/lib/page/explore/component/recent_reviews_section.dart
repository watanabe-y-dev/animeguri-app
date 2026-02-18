import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui/component/review_card/review_card.dart';
import 'package:ui/component/section_header/section_header.dart';

/// 最近のレビューセクション
///
/// 横スクロール可能なレビューカードリストを表示する
class RecentReviewsSection extends StatelessWidget {
  const RecentReviewsSection({
    super.key,
    this.onActionTap,
  });

  /// 「もっと見る」タップ時のコールバック
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: '最近のレビュー',
      actionLabel: 'もっと見る',
      onActionTap: onActionTap,
      headerPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 240,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: _mockReviews.length,
          separatorBuilder: (context, index) => const Gap(12),
          itemBuilder: (context, index) {
            final review = _mockReviews[index];
            return ReviewCard(
              avatarUrl: review.avatarUrl,
              userName: review.userName,
              timeAgo: review.timeAgo,
              rating: review.rating,
              comment: review.comment,
              spotName: review.spotName,
              animeName: review.animeName,
            );
          },
        ),
      ),
    );
  }
}

// モックデータ
class _ReviewData {
  const _ReviewData({
    required this.avatarUrl,
    required this.userName,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    required this.spotName,
    required this.animeName,
  });

  final String avatarUrl;
  final String userName;
  final String timeAgo;
  final int rating;
  final String comment;
  final String spotName;
  final String animeName;
}

const _mockReviews = [
  _ReviewData(
    avatarUrl: 'https://i.pravatar.cc/150?img=1',
    userName: 'さくら',
    timeAgo: '3時間前',
    rating: 5,
    comment: 'アニメで見たあの階段が目の前に！感動して思わず写真を何枚も撮っちゃいました',
    spotName: '住吉神社の階段',
    animeName: '君の名は。',
  ),
  _ReviewData(
    avatarUrl: 'https://i.pravatar.cc/150?img=2',
    userName: 'たろう',
    timeAgo: '5時間前',
    rating: 4,
    comment: '温泉街の雰囲気が作中そのまま！地元の人も親切で、聖地巡礼マップまでくれました',
    spotName: '渋温泉街',
    animeName: 'のんのんびより',
  ),
  _ReviewData(
    avatarUrl: 'https://i.pravatar.cc/150?img=3',
    userName: 'はなこ',
    timeAgo: '1日前',
    rating: 5,
    comment: '夕暮れ時に訪れると、アニメのワンシーンそのままの景色が広がっていて感動しました',
    spotName: '江ノ電鎌倉高校前',
    animeName: 'スラムダンク',
  ),
  _ReviewData(
    avatarUrl: 'https://i.pravatar.cc/150?img=4',
    userName: 'けんた',
    timeAgo: '2日前',
    rating: 4,
    comment: '廃校になった校舎が当時のまま残されていて、まるでアニメの世界に入り込んだみたいでした',
    spotName: '旧豊郷小学校',
    animeName: 'けいおん！',
  ),
  _ReviewData(
    avatarUrl: 'https://i.pravatar.cc/150?img=5',
    userName: 'ゆい',
    timeAgo: '3日前',
    rating: 5,
    comment: 'カフェの雰囲気が完全に再現されていて、主人公になった気分で楽しめました',
    spotName: 'ろまん亭',
    animeName: 'ご注文はうさぎですか？',
  ),
];
