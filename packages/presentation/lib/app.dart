import 'package:flutter/material.dart';
import 'package:presentation/export/router.dart';
import 'package:presentation/export/theme.dart';
import 'package:presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    final theme = AppThemeData.light();

    return AppTheme(
      theme: theme,
      child: MaterialApp.router(
        theme: theme.themeData,
        routerConfig: router.config(),
      ),
    );
  }
}
