import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

/// セクション間の区切り線ウィジェット
class SectionDivider extends HookWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return ColoredBox(
      color: colorScheme.surfaceContainerHigh,
      child: const SizedBox(
        width: double.infinity,
        height: 8,
      ),
    );
  }
}
