import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component/anime_card/anime_card.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/recommended_spots/viewmodel.dart';

class RecommendedSpotsPage extends HookWidget {
  const RecommendedSpotsPage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final RecommendedSpotsPageState state;
  final void Function(RecommendedSpotsPageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return ColoredBox(
      color: colorScheme.surface,
      child: Column(
        children: [
          // AppBar
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _BackButton(
                      onTap: () => onEvent(
                        const RecommendedSpotsPageEvent.backButtonTapped(),
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        'おすすめ聖地',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                          color: colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // 右側のスペーサー（戻るボタンと対称にする）
                    const Gap(52),
                  ],
                ),
              ),
            ),
          ),
          // Filter Chips
          _FilterChipsRow(
            chips: state.filterChips,
            selectedIndex: state.selectedFilterIndex,
            onChipTapped: (index) => onEvent(
              RecommendedSpotsPageEvent.filterChipTapped(index: index),
            ),
          ),
          // Divider
          Divider(height: 1, color: colorScheme.outlineVariant),
          // Result Info
          _ResultInfoRow(
            totalCount: state.totalCount,
            sortLabel: state.sortLabel,
            onSortTap: () => onEvent(
              const RecommendedSpotsPageEvent.sortButtonTapped(),
            ),
          ),
          // Spot Grid
          Expanded(
            child: _SpotGrid(
              spots: state.spots,
              onSpotTapped: (spotId) => onEvent(
                RecommendedSpotsPageEvent.spotTapped(spotId: spotId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends HookWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Icon(
              LucideIcons.chevronLeft,
              size: 24,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterChipsRow extends HookWidget {
  const _FilterChipsRow({
    required this.chips,
    required this.selectedIndex,
    required this.onChipTapped,
  });

  final List<FilterChipItem> chips;
  final int selectedIndex;
  final void Function(int) onChipTapped;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: List.generate(chips.length, (index) {
          final chip = chips[index];
          final isSelected = index == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => onChipTapped(index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    chip.label,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ResultInfoRow extends HookWidget {
  const _ResultInfoRow({
    required this.totalCount,
    required this.sortLabel,
    required this.onSortTap,
  });

  final int totalCount;
  final String sortLabel;
  final VoidCallback onSortTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$totalCount 件のスポット',
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          GestureDetector(
            onTap: onSortTap,
            child: Row(
              children: [
                Icon(
                  LucideIcons.arrowUpDown,
                  size: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
                const Gap(4),
                Text(
                  sortLabel,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
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

class _SpotGrid extends StatelessWidget {
  const _SpotGrid({
    required this.spots,
    required this.onSpotTapped,
  });

  final List<SpotItem> spots;
  final ValueChanged<String> onSpotTapped;

  @override
  Widget build(BuildContext context) {
    // 左カラムと右カラムに分けて交互に配置
    final leftColumn = <SpotItem>[];
    final rightColumn = <SpotItem>[];
    for (var i = 0; i < spots.length; i++) {
      if (i.isEven) {
        leftColumn.add(spots[i]);
      } else {
        rightColumn.add(spots[i]);
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: leftColumn
                    .map(
                      (spot) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: AnimeCard(
                          imageUrl: spot.imageUrl,
                          title: spot.spotName,
                          subtitle: spot.animeName,
                          icon: LucideIcons.tv,
                          width: null,
                          onTap: () => onSpotTapped(spot.id),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                children: rightColumn
                    .map(
                      (spot) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: AnimeCard(
                          imageUrl: spot.imageUrl,
                          title: spot.spotName,
                          subtitle: spot.animeName,
                          icon: LucideIcons.tv,
                          width: null,
                          onTap: () => onSpotTapped(spot.id),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
