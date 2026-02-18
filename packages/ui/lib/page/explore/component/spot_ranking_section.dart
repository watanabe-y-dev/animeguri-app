import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/component/ranking_list_item/ranking_list_item.dart';
import 'package:ui/hook/app_theme.dart';

/// 巡礼ランキングセクション
///
/// 期間バッジ付きのランキングリストを表示するセクション
class SpotRankingSection extends HookWidget {
  const SpotRankingSection({
    required this.rankings,
    this.period = '今週',
    super.key,
  });

  /// ランキングデータ
  final List<RankingItem> rankings;

  /// 期間ラベル（今週、今月など）
  final String period;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // セクションヘッダー
        _SectionHeader(period: period),
        const Gap(16),
        // ランキングリスト
        _RankingList(rankings: rankings),
      ],
    );
  }
}

class _SectionHeader extends HookWidget {
  const _SectionHeader({required this.period});

  final String period;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // タイトル
        Row(
          children: [
            const Icon(
              Icons.emoji_events,
              size: 18,
              color: Color(0xFFD4A64A), // トロフィーの特殊な色
            ),
            const Gap(8),
            Text(
              '巡礼ランキング',
              style: textTheme.titleMedium?.copyWith(
                letterSpacing: -0.2,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        // 期間バッジ
        _PeriodBadge(label: period),
      ],
    );
  }
}

class _PeriodBadge extends HookWidget {
  const _PeriodBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          fontSize: 11,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _RankingList extends HookWidget {
  const _RankingList({required this.rankings});

  final List<RankingItem> rankings;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return Container(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: rankings
              .asMap()
              .entries
              .map(
                (entry) => _RankingListItem(
                  item: entry.value,
                  isLast: entry.key == rankings.length - 1,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _RankingListItem extends HookWidget {
  const _RankingListItem({
    required this.item,
    required this.isLast,
  });

  final RankingItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return RankingListItem(
      rank: item.rank,
      title: item.spotName,
      subtitle: item.animeName,
      count: item.visitCount,
      unit: '訪問',
      thumbnailUrl: item.thumbnailUrl,
      isLast: isLast,
    );
  }
}

/// ランキングアイテム
class RankingItem {
  const RankingItem({
    required this.rank,
    required this.spotName,
    required this.animeName,
    required this.visitCount,
    this.thumbnailUrl,
  });

  final int rank;
  final String spotName;
  final String animeName;
  final int visitCount;
  final String? thumbnailUrl;
}

// モックデータ
final mockRankingData = [
  const RankingItem(
    rank: 1,
    spotName: '須賀神社の階段',
    animeName: '君の名は。',
    visitCount: 1847,
    thumbnailUrl:
        'https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=400',
  ),
  const RankingItem(
    rank: 2,
    spotName: '河口湖大橋',
    animeName: 'ゆるキャン△',
    visitCount: 1523,
    thumbnailUrl:
        'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?w=400',
  ),
  const RankingItem(
    rank: 3,
    spotName: '湯涌温泉',
    animeName: '花咲くいろは',
    visitCount: 1102,
    thumbnailUrl:
        'https://images.unsplash.com/photo-1591438252948-1c4f47f80f7c?w=400',
  ),
];
