import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component/search_bar/search_bar.dart';
import 'package:ui/component/spot_list_item/spot_list_item.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/anime_list/viewmodel.dart';

class AnimeListPage extends HookWidget {
  const AnimeListPage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final AnimeListPageState state;
  final void Function(AnimeListPageEvent) onEvent;

  static const _mockAnimeData = [
    _AnimeData(
      id: '1',
      title: 'ゆるキャン△',
      imageUrl: 'https://picsum.photos/seed/yuru/400/300',
      spotCount: 12,
      badge: SpotBadgeType.popular,
    ),
    _AnimeData(
      id: '2',
      title: '君の名は。',
      imageUrl: 'https://picsum.photos/seed/kimi/400/300',
      spotCount: 8,
      badge: SpotBadgeType.popular,
    ),
    _AnimeData(
      id: '3',
      title: '氷菓',
      imageUrl: 'https://picsum.photos/seed/hyouka/400/300',
      spotCount: 6,
      badge: SpotBadgeType.newSpot,
    ),
    _AnimeData(
      id: '4',
      title: '花咲くいろは',
      imageUrl: 'https://picsum.photos/seed/hana/400/300',
      spotCount: 8,
      badge: SpotBadgeType.trending,
    ),
    _AnimeData(
      id: '5',
      title: 'あの花',
      imageUrl: 'https://picsum.photos/seed/anohana/400/300',
      spotCount: 5,
      badge: SpotBadgeType.popular,
    ),
    _AnimeData(
      id: '6',
      title: 'けいおん！',
      imageUrl: 'https://picsum.photos/seed/keion/400/300',
      spotCount: 4,
      badge: SpotBadgeType.newSpot,
    ),
    _AnimeData(
      id: '7',
      title: '葬送のフリーレン',
      imageUrl: 'https://picsum.photos/seed/frieren/400/300',
      spotCount: 14,
      badge: SpotBadgeType.trending,
    ),
    _AnimeData(
      id: '8',
      title: 'スラムダンク',
      imageUrl: 'https://picsum.photos/seed/slam/400/300',
      spotCount: 10,
      badge: SpotBadgeType.popular,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return ColoredBox(
      color: colorScheme.surface,
      child: Column(
        children: [
          // ヘッダー
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onEvent(
                        const AnimeListPageEvent.backButtonTapped(),
                      ),
                      child: Icon(
                        LucideIcons.chevronLeft,
                        size: 24,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        '作品から探す',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Gap(12),
                    const Gap(24),
                  ],
                ),
              ),
            ),
          ),
          // 検索バー
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: AppSearchBar(
              onTap: () =>
                  onEvent(const AnimeListPageEvent.searchBarTapped()),
            ),
          ),
          // フィルターチップ
          _FilterChips(
            selectedFilter: state.selectedFilter,
            onFilterSelected: (filter) => onEvent(
              AnimeListPageEvent.filterChipSelected(filter: filter),
            ),
          ),
          // アニメリスト
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _mockAnimeData.length,
              itemBuilder: (context, index) {
                final anime = _mockAnimeData[index];
                return SpotListItem(
                  spotName: anime.title,
                  animeName: '${anime.spotCount} 聖地',
                  imageUrl: anime.imageUrl,
                  badge: anime.badge,
                  onTap: () => onEvent(
                    AnimeListPageEvent.animeCardTapped(animeId: anime.id),
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

class _FilterChips extends HookWidget {
  const _FilterChips({
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  final AnimeListFilter selectedFilter;
  final ValueChanged<AnimeListFilter> onFilterSelected;

  static const List<(AnimeListFilter, String)> _filters = [
    (AnimeListFilter.popular, '人気順'),
    (AnimeListFilter.newest, '新着順'),
    (AnimeListFilter.spotCount, '聖地数順'),
    (AnimeListFilter.alphabetical, '50音順'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: _filters.map((entry) {
          final (filter, label) = entry;
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: EdgeInsets.only(
              right: filter != AnimeListFilter.alphabetical ? 8 : 0,
            ),
            child: GestureDetector(
              onTap: () => onFilterSelected(filter),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _AnimeData {
  const _AnimeData({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.spotCount,
    required this.badge,
  });

  final String id;
  final String title;
  final String imageUrl;
  final int spotCount;
  final SpotBadgeType badge;
}
