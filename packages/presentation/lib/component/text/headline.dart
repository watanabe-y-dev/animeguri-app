import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/hook/app_theme.dart';

class HeadlineLarge extends HookWidget {
  const HeadlineLarge(
    this.data, {
    super.key,
    this.color,
  });

  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();
    return Text(
      data,
      style: theme.textTheme.headlineLarge?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class HeadlineMedium extends HookWidget {
  const HeadlineMedium(
    this.data, {
    super.key,
    this.color,
  });

  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    return Text(
      data,
      style: theme.textTheme.headlineMedium?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class HeadlineSmall extends HookWidget {
  const HeadlineSmall(
    this.data, {
    super.key,
    this.color,
  });

  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    return Text(
      data,
      style: theme.textTheme.headlineSmall?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}
