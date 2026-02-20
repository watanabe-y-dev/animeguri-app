import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component/section_header/section_header.dart';
import 'package:ui/hook/app_theme.dart';

class ReviewItem {
  const ReviewItem({
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

class ReviewSection extends HookWidget {
  const ReviewSection({
    super.key,
    required this.reviews,
    this.onMoreTap,
  });

  final List<ReviewItem> reviews;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      child: SectionHeader(
        title: 'レビュー',
        actionLabel: 'すべて見る',
        onActionTap: onMoreTap,
        child: Column(
          children: [
            for (var i = 0; i < reviews.length; i++) ...[
              if (i > 0) const Gap(12),
              _ReviewCard(review: reviews[i]),
            ],
          ],
        ),
      ),
    );
  }
}

class _ReviewCard extends HookWidget {
  const _ReviewCard({required this.review});

  final ReviewItem review;

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
            color: colorScheme.shadow.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ユーザー情報
          _UserRow(
            userName: review.userName,
            timeAgo: review.timeAgo,
          ),
          const Gap(12),
          // 星評価
          _StarRating(rating: review.rating),
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
          _SpotInfo(
            spotName: review.spotName,
            animeName: review.animeName,
          ),
        ],
      ),
    );
  }
}

class _UserRow extends HookWidget {
  const _UserRow({
    required this.userName,
    required this.timeAgo,
  });

  final String userName;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Row(
      children: [
        // アバター
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: textTheme.labelLarge?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(2),
              Text(
                timeAgo,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 10,
                  color: colorScheme.onSurface.withValues(alpha: 0.38),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StarRating extends HookWidget {
  const _StarRating({required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
          child: Icon(
            LucideIcons.star,
            size: 14,
            color: index < rating
                ? const Color(0xFFF5A623)
                : colorScheme.outlineVariant,
          ),
        );
      }),
    );
  }
}

class _SpotInfo extends HookWidget {
  const _SpotInfo({
    required this.spotName,
    required this.animeName,
  });

  final String spotName;
  final String animeName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Container(
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
          Flexible(
            child: Text(
              spotName,
              style: textTheme.labelSmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(6),
          Text(
            '\u30fb',
            style: textTheme.labelSmall?.copyWith(
              fontSize: 11,
              color: colorScheme.onSurface.withValues(alpha: 0.38),
            ),
          ),
          const Gap(6),
          Flexible(
            child: Text(
              animeName,
              style: textTheme.labelSmall?.copyWith(
                fontSize: 11,
                color: colorScheme.onSurface.withValues(alpha: 0.38),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
