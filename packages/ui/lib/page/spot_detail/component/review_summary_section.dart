import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component.dart';
import 'package:ui/hook/app_theme.dart';

class ReviewData {
  const ReviewData({
    required this.userName,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    required this.spotName,
    required this.animeName,
  });

  final String userName;
  final String timeAgo;
  final int rating;
  final String comment;
  final String spotName;
  final String animeName;
}

class ReviewSummarySection extends HookWidget {
  const ReviewSummarySection({
    super.key,
    required this.averageRating,
    required this.reviewCount,
    required this.ratingDistribution,
    required this.reviews,
    required this.onSeeAllTap,
  });

  final double averageRating;
  final int reviewCount;

  /// 1 から 5 の各スコアの件数 (index 0 = 1 星, index 4 = 5 星)
  final List<int> ratingDistribution;
  final List<ReviewData> reviews;
  final VoidCallback onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    final maxCount = ratingDistribution.isEmpty
        ? 1
        : ratingDistribution.reduce((a, b) => a > b ? a : b);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          // ヘッダー
          SectionHeader(
            title: 'レビュー',
            actionLabel: 'すべて見る',
            onActionTap: onSeeAllTap,
            child: const SizedBox.shrink(),
          ),
          // レビューサマリー
          Row(
            children: [
              // 左: 平均評価
              Column(
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const Gap(4),
                  // 星
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
                        child: Icon(
                          LucideIcons.star,
                          size: 16,
                          color: index < averageRating.round()
                              ? const Color(0xFFF5A623)
                              : colorScheme.outlineVariant,
                        ),
                      );
                    }),
                  ),
                  const Gap(4),
                  Text(
                    '$reviewCount 件のレビュー',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const Gap(16),
              // 右: 棒グラフ
              Expanded(
                child: Column(
                  children: List.generate(5, (index) {
                    final score = 5 - index;
                    final count = ratingDistribution.length >= score
                        ? ratingDistribution[score - 1]
                        : 0;
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 4 ? 0 : 4),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                            child: Text(
                              '$score',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Gap(6),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: SizedBox(
                                height: 6,
                                child: LinearProgressIndicator(
                                  value: maxCount > 0 ? count / maxCount : 0,
                                  backgroundColor:
                                      colorScheme.surfaceContainerHigh,
                                  valueColor: AlwaysStoppedAnimation(
                                    colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          const Gap(16),
          // レビューリスト
          ...reviews.map(
            (review) => Padding(
              padding: EdgeInsets.only(
                bottom: review == reviews.last ? 0 : 12,
              ),
              child: _ReviewCard(review: review),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends HookWidget {
  const _ReviewCard({required this.review});

  final ReviewData review;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ユーザー行
          Row(
            children: [
              // アバター
              CircleAvatar(
                radius: 16,
                backgroundColor: colorScheme.primary,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: textTheme.labelLarge?.copyWith(
                        fontSize: 13,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      review.timeAgo,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(12),
          // 星
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
                child: Icon(
                  LucideIcons.star,
                  size: 14,
                  color: index < review.rating
                      ? const Color(0xFFF5A623)
                      : colorScheme.outlineVariant,
                ),
              );
            }),
          ),
          const Gap(12),
          // コメント
          Text(
            review.comment,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const Gap(12),
          // スポット情報
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colorScheme.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  LucideIcons.mapPin,
                  size: 12,
                  color: colorScheme.primary,
                ),
                const Gap(6),
                Text(
                  review.spotName,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(6),
                Text(
                  '・',
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(6),
                Text(
                  review.animeName,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
