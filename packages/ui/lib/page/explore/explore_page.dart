import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

@RoutePage()
class ExplorePage extends HookWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    return Scaffold(
      appBar: AppBar(
        title: const Text('発見'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              size: 64,
              color: colorScheme.onSurface,
            ),
            const SizedBox(height: 16),
            Text(
              '発見画面',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '新しい聖地を探します',
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
