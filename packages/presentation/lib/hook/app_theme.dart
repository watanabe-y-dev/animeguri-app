import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/export/theme.dart';
import 'package:presentation/theme/app_theme.dart';

AppThemeData useAppTheme() {
  final context = useContext();
  return AppTheme.of(context);
}
