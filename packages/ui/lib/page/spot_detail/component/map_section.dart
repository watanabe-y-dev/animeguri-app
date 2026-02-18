import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component.dart';
import 'package:ui/hook/app_theme.dart';

class MapSection extends HookWidget {
  const MapSection({
    super.key,
    required this.mapImageUrl,
    required this.distance,
    required this.onOpenMapTap,
  });

  final String mapImageUrl;
  final String distance;
  final VoidCallback onOpenMapTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          // ヘッダー
          const IconSectionHeader(
            icon: LucideIcons.map,
            title: 'アクセス',
          ),
          const Gap(12),
          // 地図プレビュー
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              mapImageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    LucideIcons.map,
                    size: 48,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          const Gap(12),
          // 距離・地図アプリで開く
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    LucideIcons.navigation,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const Gap(6),
                  Text(
                    distance,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onOpenMapTap,
                child: Text(
                  '地図アプリで開く',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
