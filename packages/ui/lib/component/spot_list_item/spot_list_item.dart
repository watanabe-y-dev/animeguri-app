import 'package:flutter/material.dart';

enum SpotBadgeType {
  newSpot,
  trending,
  popular,
}

class SpotListItem extends StatelessWidget {
  const SpotListItem({
    super.key,
    required this.spotName,
    required this.animeName,
    required this.imageUrl,
    this.badge,
  });

  final String spotName;
  final String animeName;
  final String imageUrl;
  final SpotBadgeType? badge;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
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
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
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
    );
  }
}

class _SpotBadge extends StatelessWidget {
  const _SpotBadge({required this.type});

  final SpotBadgeType type;

  @override
  Widget build(BuildContext context) {
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
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
