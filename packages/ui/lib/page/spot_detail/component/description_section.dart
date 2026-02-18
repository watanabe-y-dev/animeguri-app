import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

class DescriptionSection extends HookWidget {
  const DescriptionSection({
    super.key,
    required this.animeTitle,
    required this.animeEpisode,
    required this.animeThumbnailUrl,
    required this.description,
    required this.onAnimeReferenceTap,
  });

  final String animeTitle;
  final String animeEpisode;
  final String animeThumbnailUrl;
  final String description;
  final VoidCallback onAnimeReferenceTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // セクションタイトル
          Text(
            '作品との関連',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const Gap(12),
          // アニメ参照カード
          Material(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: onAnimeReferenceTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.outlineVariant),
                ),
                child: Row(
                  children: [
                    // サムネイル
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        animeThumbnailUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 48,
                          height: 48,
                          color: colorScheme.surfaceContainerHigh,
                          child: Icon(
                            Icons.movie,
                            size: 24,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    // タイトル・エピソード
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            animeTitle,
                            style: textTheme.labelLarge?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const Gap(2),
                          Text(
                            animeEpisode,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      LucideIcons.chevronRight,
                      size: 18,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(12),
          // 説明文
          Text(
            description,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
