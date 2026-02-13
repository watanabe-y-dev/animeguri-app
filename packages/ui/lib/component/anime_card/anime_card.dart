import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.pilgrimageCount,
  });

  final String imageUrl;
  final String title;
  final int pilgrimageCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 12,
            color: colorScheme.shadow.withValues(alpha: 0.03),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          SizedBox(
            height: 90,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => ColoredBox(
                color: colorScheme.outlineVariant,
                child: Center(
                  child: Icon(Icons.image, color: colorScheme.onSurfaceVariant),
                ),
              ),
            ),
          ),
          // Content area
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(4),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.mapPin,
                      size: 12,
                      color: Color(0xFF3D8A5A),
                    ),
                    const Gap(4),
                    Text(
                      '$pilgrimageCount 聖地',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
