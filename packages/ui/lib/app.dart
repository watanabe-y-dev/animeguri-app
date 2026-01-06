import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/router/app_router.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeData.light();
    final router = AppRouter();

    return AppTheme(
      theme: theme,
      child: MaterialApp.router(
        theme: theme.themeData,
        routerConfig: router.config(),
      ),
    );
  }
}
