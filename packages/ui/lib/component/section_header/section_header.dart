import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

/// セクションヘッダーウィジェット
///
/// タイトルとアクションリンク、コンテンツエリアを持つ汎用コンポーネント
class SectionHeader extends HookWidget {
  const SectionHeader({
    required this.title,
    required this.child,
    this.actionLabel,
    this.onActionTap,
    this.headerPadding = EdgeInsets.zero,
    super.key,
  });

  /// セクションタイトル
  final String title;

  /// アクションラベル（「もっと見る」「すべて」など）
  final String? actionLabel;

  /// アクションタップ時のコールバック
  final VoidCallback? onActionTap;

  /// ヘッダー部分の左右パディング（横スクロールのコンテンツで使用）
  final EdgeInsetsGeometry headerPadding;

  /// セクションのコンテンツ
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // セクションヘッダー
        Padding(
          padding: headerPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  letterSpacing: -0.2,
                  color: colorScheme.onSurface,
                ),
              ),
              if (actionLabel != null)
                TextButton(
                  onPressed: onActionTap,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    actionLabel!,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // コンテンツ
        child,
      ],
    );
  }
}
