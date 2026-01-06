import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

class LabelLarge extends HookWidget {
  const LabelLarge(
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
      style: theme.textTheme.labelLarge?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class LabelMedium extends HookWidget {
  const LabelMedium(
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
      style: theme.textTheme.labelMedium?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class LabelSmall extends HookWidget {
  const LabelSmall(
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
      style: theme.textTheme.labelSmall?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}
