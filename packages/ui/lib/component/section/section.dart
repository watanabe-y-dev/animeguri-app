import 'package:flutter/material.dart';

/// セクションウィジェット
///
/// タイトルとアクションリンク、コンテンツエリアを持つ汎用コンポーネント
class Section extends StatelessWidget {
  const Section({
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                  color: colorScheme.onSurface,
                ),
              ),
              if (actionLabel != null)
                GestureDetector(
                  onTap: onActionTap,
                  child: Text(
                    actionLabel!,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
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
