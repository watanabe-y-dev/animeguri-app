import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';

@RoutePage()
class SavedPage extends HookWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    return Scaffold(
      appBar: AppBar(
        title: const Text('しおり'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark,
              size: 64,
              color: colorScheme.onSurface,
            ),
            const Gap(16),
            Text(
              'しおり画面',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const Gap(8),
            Text(
              'お気に入りの聖地を管理します',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
