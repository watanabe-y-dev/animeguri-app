import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                  height: 1.429,
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
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      height: 1.15,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const Gap(16),
        // コンテンツ
        child,
      ],
    );
  }
}
