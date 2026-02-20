import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';

class StatItem {
  const StatItem({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;
}

class StatsRow extends HookWidget {
  const StatsRow({
    super.key,
    required this.stats,
  });

  final List<StatItem> stats;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (var i = 0; i < stats.length; i++) ...[
              Expanded(
                child: _StatItemView(
                  item: stats[i],
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
              ),
              if (i < stats.length - 1)
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: colorScheme.outlineVariant,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatItemView extends StatelessWidget {
  const _StatItemView({
    required this.item,
    required this.textTheme,
    required this.colorScheme,
  });

  final StatItem item;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.value,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const Gap(2),
          Text(
            item.label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
