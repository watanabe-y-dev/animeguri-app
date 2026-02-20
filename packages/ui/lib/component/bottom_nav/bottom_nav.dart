import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';

class BottomNavItem {
  const BottomNavItem({
    required this.iconData,
    required this.label,
  });

  final IconData iconData;
  final String label;
}

class BottomNav extends HookWidget {
  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  final int currentIndex;
  final List<BottomNavItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Container(
      height: 84,
      padding: const EdgeInsets.only(top: 12, bottom: 34),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            blurRadius: 8,
            color: colorScheme.shadow.withValues(alpha: 0.06),
          ),
        ],
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = index == currentIndex;
          final color = isActive
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant.withValues(alpha: 0.6);

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.iconData,
                    size: 22,
                    color: color,
                  ),
                  const Gap(4),
                  Text(
                    item.label,
                    style: textTheme.labelSmall?.copyWith(
                      color: color,
                      fontWeight:
                          isActive ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
