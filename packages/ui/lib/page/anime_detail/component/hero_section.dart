import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

class HeroStatItem {
  const HeroStatItem({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;
}

class HeroSection extends HookWidget {
  const HeroSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.stats,
    this.onOfficialSiteTap,
    this.onXLinkTap,
  });

  final String title;
  final String subtitle;
  final List<HeroStatItem> stats;
  final VoidCallback? onOfficialSiteTap;
  final VoidCallback? onXLinkTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surface,
          ],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // タイトル
          Text(
            title,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              color: colorScheme.onSurface,
            ),
          ),
          const Gap(4),
          Text(
            subtitle,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(16),
          // 統計
          _StatsRow(stats: stats),
          const Gap(16),
          // 公式リンク
          _OfficialLinks(
            onOfficialSiteTap: onOfficialSiteTap,
            onXLinkTap: onXLinkTap,
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends HookWidget {
  const _StatsRow({required this.stats});

  final List<HeroStatItem> stats;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Row(
      children: [
        for (var i = 0; i < stats.length; i++) ...[
          if (i > 0) const Gap(24),
          Column(
            children: [
              Text(
                stats[i].value,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                  color: colorScheme.primary,
                ),
              ),
              const Gap(2),
              Text(
                stats[i].label,
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _OfficialLinks extends HookWidget {
  const _OfficialLinks({
    this.onOfficialSiteTap,
    this.onXLinkTap,
  });

  final VoidCallback? onOfficialSiteTap;
  final VoidCallback? onXLinkTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _LinkChip(
          icon: LucideIcons.globe,
          label: '公式サイト',
          onTap: onOfficialSiteTap,
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
        _LinkChip(
          iconWidget: Text(
            '\ud835\udd4f',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          label: '公式',
          onTap: onXLinkTap,
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
      ],
    );
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({
    this.icon,
    this.iconWidget,
    required this.label,
    this.onTap,
    required this.colorScheme,
    required this.textTheme,
  });

  final IconData? icon;
  final Widget? iconWidget;
  final String label;
  final VoidCallback? onTap;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ?iconWidget,
              Text(
                label,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
              Icon(
                LucideIcons.externalLink,
                size: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
