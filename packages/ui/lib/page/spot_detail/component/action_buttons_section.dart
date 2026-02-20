import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

class ActionButtonsSection extends HookWidget {
  const ActionButtonsSection({
    super.key,
    required this.onCheckinTap,
    required this.onRouteTap,
  });

  final VoidCallback onCheckinTap;
  final VoidCallback onRouteTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      child: Row(
        children: [
          // 訪問記録ボタン
          Expanded(
            child: Material(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: onCheckinTap,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.checkCircle,
                        size: 16,
                        color: colorScheme.onPrimary,
                      ),
                      const Gap(8),
                      Text(
                        '訪問記録',
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          // ルート案内ボタン
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: onRouteTap,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.navigation,
                          size: 16,
                          color: colorScheme.onSurface,
                        ),
                        const Gap(8),
                        Text(
                          'ルート案内',
                          style: textTheme.labelLarge?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
