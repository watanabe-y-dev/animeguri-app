import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/component/section_header/section_header.dart';
import 'package:ui/hook/app_theme.dart';

class SpotItem {
  const SpotItem({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    this.isNew = false,
  });

  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final bool isNew;
}

class SpotListSection extends HookWidget {
  const SpotListSection({
    super.key,
    required this.spots,
    this.onSpotTap,
    this.onMoreTap,
  });

  final List<SpotItem> spots;
  final void Function(String spotId)? onSpotTap;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: SectionHeader(
        title: '聖地スポット',
        actionLabel: 'マップで見る',
        onActionTap: onMoreTap,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Column(
            children: [
              for (final spot in spots)
                _SpotListTile(
                  spot: spot,
                  onTap: () => onSpotTap?.call(spot.id),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpotListTile extends HookWidget {
  const _SpotListTile({
    required this.spot,
    this.onTap,
  });

  final SpotItem spot;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                // サムネイル
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    spot.imageUrl,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 56,
                      height: 56,
                      color: colorScheme.surfaceContainerHigh,
                      child: Icon(
                        Icons.image,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                const Gap(14),
                // 情報
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spot.name,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              spot.category,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (spot.isNew) ...[
                            const Gap(6),
                            Text(
                              '\u30fb',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.38,
                                ),
                              ),
                            ),
                            const Gap(6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '新着',
                                style: textTheme.labelSmall?.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
