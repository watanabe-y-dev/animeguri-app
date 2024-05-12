import 'package:flutter/material.dart';
import 'package:presentation/theme/app_theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeData.light().themeData;

    return MaterialApp(
      theme: theme,
      home: const Scaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
