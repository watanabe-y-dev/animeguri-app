import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

AppThemeData useAppTheme() {
  final context = useContext();
  return AppTheme.of(context);
}

ColorScheme useColorScheme() {
  final context = useContext();
  return Theme.of(context).colorScheme;
}
