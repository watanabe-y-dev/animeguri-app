import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component.dart';
import 'package:ui/hook/app_theme.dart';

class SpotInfoSection extends HookWidget {
  const SpotInfoSection({
    super.key,
    required this.spotName,
    required this.category,
    required this.animeName,
    required this.animeSpotCount,
    required this.address,
    required this.visitorCount,
    required this.rating,
    required this.reviewCount,
    required this.onBookmarkTap,
  });

  final String spotName;
  final String category;
  final String animeName;
  final int animeSpotCount;
  final String address;
  final String visitorCount;
  final String rating;
  final String reviewCount;
  final VoidCallback onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 名前行
          Row(
            children: [
              Expanded(
                child: Text(
                  spotName,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const Gap(12),
              // ブックマークボタン
              SizedBox(
                width: 40,
                height: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: onBookmarkTap,
                      child: Center(
                        child: Icon(
                          LucideIcons.bookmark,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          // カテゴリ・作品バッジ行
          Row(
            children: [
              // カテゴリバッジ
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const Gap(12),
              // アニメバッジ
              AnimeBadge(
                name: animeName,
                count: animeSpotCount,
              ),
            ],
          ),
          const Gap(12),
          // 住所行
          Row(
            children: [
              Icon(
                LucideIcons.mapPin,
                size: 14,
                color: colorScheme.primary,
              ),
              const Gap(6),
              Text(
                address,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap(12),
          // 統計行
          StatsRow(
            stats: [
              StatItem(value: visitorCount, label: '訪問者'),
              StatItem(value: rating, label: '評価'),
              StatItem(value: reviewCount, label: 'レビュー'),
            ],
          ),
        ],
      ),
    );
  }
}
