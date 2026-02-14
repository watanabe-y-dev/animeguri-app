import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/core/widget/divided_column.dart';
import 'package:ui/hook/app_theme.dart';

@RoutePage()
class DebugTypographyPage extends HookWidget {
  const DebugTypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography Debug Page'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DividedColumn(
              divider: const Gap(16),
              tail: true,
              children: [
                Text(
                  'Display Large 日本語',
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Display Medium 日本語',
                  style: textTheme.displayMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Display Small 日本語',
                  style: textTheme.displaySmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Headline Large 日本語',
                  style: textTheme.headlineLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Headline Medium 日本語',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Headline Small 日本語',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Title Large 日本語',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Title Medium 日本語',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Title Small 日本語',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Body Large 日本語',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Body Medium 日本語',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Body Small 日本語',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Label Large 日本語',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Label Medium 日本語',
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Label Small 日本語',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
