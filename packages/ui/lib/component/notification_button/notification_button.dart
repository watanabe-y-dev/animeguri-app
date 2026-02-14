import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

class NotificationButton extends HookWidget {
  const NotificationButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return SizedBox(
      width: 44,
      height: 44,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: colorScheme.shadow.withValues(alpha: 0.03),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onPressed,
            child: Center(
              child: Icon(
                LucideIcons.bell,
                size: 20,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
