import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

/// アイコン付きセクションヘッダーウィジェット
///
/// アイコンとタイトルを横並びで表示するヘッダーコンポーネント
class IconSectionHeader extends HookWidget {
  const IconSectionHeader({
    required this.icon,
    required this.title,
    super.key,
  });

  /// セクションアイコン
  final IconData icon;

  /// セクションタイトル
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Row(
      spacing: 8,
      children: [
        Icon(
          icon,
          color: colorScheme.primary,
        ),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
