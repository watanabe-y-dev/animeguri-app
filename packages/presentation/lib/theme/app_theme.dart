import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/theme/app_theme_data.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({
    super.key,
    required this.theme,
    required this.child,
  });

  final AppThemeData theme;
  final Widget child;

  static AppThemeData of(BuildContext context) {
    return context.getInheritedWidgetOfExactType<_AppTheme>()!.theme;
  }

  @override
  Widget build(BuildContext context) {
    return _AppTheme(
      theme: theme,
      child: child,
    );
  }
}

final class _AppTheme extends InheritedWidget {
  const _AppTheme({
    required super.child,
    required this.theme,
  });

  final AppThemeData theme;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
