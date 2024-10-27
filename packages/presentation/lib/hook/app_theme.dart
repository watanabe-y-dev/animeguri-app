import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/theme/app_theme.dart';
import 'package:presentation/theme/app_theme_data.dart';

AppThemeData useAppTheme() {
  final context = useContext();
  return AppTheme.of(context);
}
