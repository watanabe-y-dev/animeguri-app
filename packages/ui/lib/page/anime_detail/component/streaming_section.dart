import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/component/icon_section_header/icon_section_header.dart';
import 'package:ui/hook/app_theme.dart';

class StreamingPlatform {
  const StreamingPlatform({
    required this.name,
    required this.iconText,
    required this.iconColor,
    required this.planType,
  });

  final String name;
  final String iconText;
  final Color iconColor;
  final String planType;
}

class StreamingSection extends HookWidget {
  const StreamingSection({
    super.key,
    required this.platforms,
    this.onPlatformTap,
  });

  final List<StreamingPlatform> platforms;
  final void Function(String name)? onPlatformTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IconSectionHeader(
            icon: LucideIcons.playCircle,
            title: '配信情報',
          ),
          const Gap(14),
          Column(
            children: [
              for (var i = 0; i < platforms.length; i++) ...[
                if (i > 0) const Gap(10),
                _PlatformCard(
                  platform: platforms[i],
                  onTap: () => onPlatformTap?.call(platforms[i].name),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _PlatformCard extends HookWidget {
  const _PlatformCard({
    required this.platform,
    this.onTap,
  });

  final StreamingPlatform platform;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          // プラットフォームアイコン
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: platform.iconColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              platform.iconText,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(12),
          // プラットフォーム情報
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform.name,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const Gap(2),
                Text(
                  platform.planType,
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          // 視聴ボタン
          Material(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    Icon(
                      LucideIcons.externalLink,
                      size: 12,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    Text(
                      '視聴する',
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
