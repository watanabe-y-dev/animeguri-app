import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/component.dart';
import 'package:ui/hook/app_theme.dart';

class HourEntry {
  const HourEntry({
    required this.dayLabel,
    required this.time,
  });

  final String dayLabel;
  final String time;
}

class HoursSection extends HookWidget {
  const HoursSection({
    super.key,
    required this.isOpen,
    required this.hours,
  });

  final bool isOpen;
  final List<HourEntry> hours;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          // ヘッダー行
          Row(
            children: [
              const Expanded(
                child: IconSectionHeader(
                  icon: Icons.access_time,
                  title: '営業情報',
                ),
              ),
              // 営業中バッジ
              if (isOpen)
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '営業中',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const Gap(16),
          // 営業時間リスト
          ...hours.map(
            (entry) => Padding(
              padding: EdgeInsets.only(
                bottom: entry == hours.last ? 0 : 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.dayLabel,
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    entry.time,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
