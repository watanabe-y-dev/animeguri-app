import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/hook/app_theme.dart';

class BodyLarge extends HookWidget {
  const BodyLarge(
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
      style: theme.textTheme.bodyLarge?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class BodyMedium extends HookWidget {
  const BodyMedium(
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
      style: theme.textTheme.bodyMedium?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

class BodySmall extends HookWidget {
  const BodySmall(
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
      style: theme.textTheme.bodySmall?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}
