import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/hook/app_theme.dart';

class DisplayLarge extends HookWidget {
  const DisplayLarge(
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
      style: theme.textTheme.displayLarge?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class DisplayMedium extends HookWidget {
  const DisplayMedium(
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
      style: theme.textTheme.displayMedium?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class DisplaySmall extends HookWidget {
  const DisplaySmall(
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
      style: theme.textTheme.displaySmall?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}
