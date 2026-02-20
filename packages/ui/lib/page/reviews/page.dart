import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component/back_button/back_button.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/reviews/component/review_list_item/review_list_item.dart';
import 'package:ui/page/reviews/viewmodel.dart';

class ReviewsPage extends HookWidget {
  const ReviewsPage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final ReviewsPageState state;
  final void Function(ReviewsPageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return ColoredBox(
      color: colorScheme.surface,
      child: Column(
        children: [
          _AppBar(
            onBackTap: () =>
                onEvent(const ReviewsPageEvent.backButtonTapped()),
          ),
          _FilterSection(
            onSortTap: () =>
                onEvent(const ReviewsPageEvent.sortChipTapped()),
            onFilterTap: (filter) =>
                onEvent(ReviewsPageEvent.filterChipTapped(filter: filter)),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _mockReviews.length,
              itemBuilder: (context, index) {
                final review = _mockReviews[index];
                return ReviewListItem(
                  userName: review.userName,
                  timeAgo: review.timeAgo,
                  rating: review.rating,
                  comment: review.comment,
                  spotName: review.spotName,
                  animeName: review.animeName,
                  avatarColor: review.avatarColor,
                  onTap: () => onEvent(
                    ReviewsPageEvent.reviewTapped(reviewId: review.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends HookWidget {
  const _AppBar({required this.onBackTap});

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(onPressed: onBackTap),
              Text(
                '最近のレビュー',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 40, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterSection extends HookWidget {
  const _FilterSection({
    required this.onSortTap,
    required this.onFilterTap,
  });

  final VoidCallback onSortTap;
  final void Function(String) onFilterTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _SortChip(onTap: onSortTap),
            const Gap(8),
            _FilterChip(
              label: 'すべて',
              isSelected: true,
              onTap: () => onFilterTap('all'),
            ),
            const Gap(8),
            _FilterChip(
              label: '高評価',
              isSelected: false,
              onTap: () => onFilterTap('high_rating'),
            ),
            const Gap(8),
            _FilterChip(
              label: '写真付き',
              isSelected: false,
              onTap: () => onFilterTap('with_photo'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SortChip extends HookWidget {
  const _SortChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.arrowUpDown,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
            const Gap(6),
            Text(
              '新着順',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
            const Gap(6),
            Icon(
              LucideIcons.chevronDown,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends HookWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(100),
          border: isSelected
              ? null
              : Border.all(color: colorScheme.outlineVariant),
        ),
        child: Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected
                ? colorScheme.onPrimary
                : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

// モックデータ
class _ReviewMockData {
  const _ReviewMockData({
    required this.id,
    required this.userName,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    required this.spotName,
    required this.animeName,
    required this.avatarColor,
  });

  final String id;
  final String userName;
  final String timeAgo;
  final int rating;
  final String comment;
  final String spotName;
  final String animeName;
  final Color avatarColor;
}

const _mockReviews = [
  _ReviewMockData(
    id: '1',
    userName: 'さくら',
    timeAgo: '3 時間前',
    rating: 4,
    comment:
        '秋葉原の聖地巡りは最高でした！アニメで見た場所がそのまま再現されていて感動しました。写真もたくさん撮れました。',
    spotName: '秋葉原電気街',
    animeName: 'シュタインズ・ゲート',
    avatarColor: Color(0xFF6750A4),
  ),
  _ReviewMockData(
    id: '2',
    userName: 'たろう',
    timeAgo: '5 時間前',
    rating: 5,
    comment:
        '氷菓の舞台となった高山市を訪れました。古い町並みがアニメそのまま！お団子も美味しかったです。また行きたいな。',
    spotName: '高山市古い町並み',
    animeName: '氷菓',
    avatarColor: Color(0xFF7D5260),
  ),
  _ReviewMockData(
    id: '3',
    userName: 'はなこ',
    timeAgo: '昨日',
    rating: 3,
    comment:
        '鎌倉高校前の踏切は思った以上に混んでいましたが、海と江ノ電のコントラストが素晴らしかったです。スラムダンクファンなら一度は訪れるべき！',
    spotName: '鎌倉高校前踏切',
    animeName: 'スラムダンク',
    avatarColor: Color(0xFF625B71),
  ),
  _ReviewMockData(
    id: '4',
    userName: 'けんた',
    timeAgo: '2 日前',
    rating: 4,
    comment:
        '竜ヶ洞は「君の名は。」の糸守湖のモデルと言われていますが、実際に見ると本当に神秘的でした。朝早い時間帯がおすすめです。',
    spotName: '諏訪湖',
    animeName: '君の名は。',
    avatarColor: Color(0xFFEADDFF),
  ),
];
