import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

enum SpotBadgeType {
  newSpot,
  trending,
  popular,
}

class SpotListItem extends HookWidget {
  const SpotListItem({
    super.key,
    required this.spotName,
    required this.animeName,
    required this.imageUrl,
    this.badge,
    this.onTap,
  });

  final String spotName;
  final String animeName;
  final String imageUrl;
  final SpotBadgeType? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: colorScheme.primary.withValues(alpha: 0.1),
          highlightColor: colorScheme.primary.withValues(alpha: 0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 56,
                      height: 56,
                      color: colorScheme.outlineVariant,
                      child: Icon(
                        Icons.image,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spotName,
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              animeName,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (badge != null) ...[
                            const SizedBox(width: 6),
                            _SpotBadge(type: badge!),
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

class _SpotBadge extends HookWidget {
  const _SpotBadge({required this.type});

  final SpotBadgeType type;

  @override
  Widget build(BuildContext context) {
    final textTheme = useTextTheme();
    final (label, textColor, bgColor) = switch (type) {
      SpotBadgeType.newSpot => (
        '新着',
        const Color(0xFF3D8A5A),
        const Color(0xFFC8F0D8),
      ),
      SpotBadgeType.trending => (
        '話題',
        const Color(0xFF3D8A5A),
        const Color(0xFFC8F0D8),
      ),
      SpotBadgeType.popular => (
        '人気',
        const Color(0xFFD89575),
        const Color(0xFFFFF0E6),
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          fontSize: 11,
          color: textColor,
        ),
      ),
    );
  }
}
