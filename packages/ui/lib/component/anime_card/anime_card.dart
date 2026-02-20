import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

class AnimeCard extends HookWidget {
  const AnimeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.spotCount,
    this.badge,
    this.icon,
    this.width = 140,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final String? subtitle;
  final int? spotCount;
  final String? badge;
  final IconData? icon;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return SizedBox(
      width: width,
      child: Material(
        type: MaterialType.card,
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        shadowColor: colorScheme.shadow.withValues(alpha: 0.03),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: colorScheme.primary.withValues(alpha: 0.1),
          highlightColor: colorScheme.primary.withValues(alpha: 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image area
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => ColoredBox(
                      color: colorScheme.outlineVariant,
                      child: Center(
                        child: Icon(
                          Icons.image,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
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
                      style: textTheme.labelLarge?.copyWith(
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
                        Icon(
                          icon ?? LucideIcons.mapPin,
                          size: 12,
                          color: colorScheme.primary,
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            subtitle ?? '$spotCount 聖地',
                            style: textTheme.labelSmall?.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
