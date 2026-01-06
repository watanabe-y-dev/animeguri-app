import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

class TitleLarge extends HookWidget {
  const TitleLarge(
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
      style: theme.textTheme.titleLarge?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class TitleMedium extends HookWidget {
  const TitleMedium(
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
      style: theme.textTheme.titleMedium?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class TitleSmall extends HookWidget {
  const TitleSmall(
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
      style: theme.textTheme.titleSmall?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}
