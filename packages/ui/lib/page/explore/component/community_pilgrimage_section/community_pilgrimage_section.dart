import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component/section/section_header.dart';
import 'package:ui/hook/app_theme.dart';

/// みんなの巡礼セクション
///
/// 左側に大きい写真1つ、右側に小さい写真2つを縦並びで表示するグリッドレイアウト
class CommunityPilgrimageSection extends HookWidget {
  const CommunityPilgrimageSection({
    super.key,
    this.onActionTap,
  });

  /// 「もっと見る」タップ時のコールバック
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: 'みんなの巡礼',
      actionLabel: 'もっと見る',
      onActionTap: onActionTap,
      child: const _PhotoGrid(),
    );
  }
}

/// 写真グリッドレイアウト
class _PhotoGrid extends HookWidget {
  const _PhotoGrid();

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          // 左側：大きい写真
          Expanded(
            child: _PhotoCard(
              backgroundColor: colorScheme.surfaceContainerHigh,
              username: '@sakura_trip',
              avatarColor: const Color(0xFF3D8A5A), // 特殊な色
              usernameStyle: _PhotoCardUsernameStyle.large,
            ),
          ),
          const SizedBox(width: 8),
          // 右側：小さい写真2つを縦並び
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: _PhotoCard(
                    backgroundColor: colorScheme.surfaceContainerHigh,
                    username: '@anime_fan',
                    avatarColor: const Color(0xFFD89575), // 特殊な色
                    usernameStyle: _PhotoCardUsernameStyle.small,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: _PhotoCard(
                    backgroundColor: colorScheme.surfaceContainerHigh,
                    username: '@seichi_go',
                    avatarColor: const Color(0xFF4D9B6A), // 特殊な色
                    usernameStyle: _PhotoCardUsernameStyle.small,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 写真カードのユーザー名表示スタイル
enum _PhotoCardUsernameStyle {
  /// 大きい写真用（fontSize: 11, avatarSize: 22, gap: 6, padding: 10）
  large,

  /// 小さい写真用（fontSize: 10, avatarSize: 18, gap: 4, padding: 8）
  small,
}

/// 写真カード
class _PhotoCard extends HookWidget {
  const _PhotoCard({
    required this.backgroundColor,
    required this.username,
    required this.avatarColor,
    required this.usernameStyle,
  });

  final Color backgroundColor;
  final String username;
  final Color avatarColor;
  final _PhotoCardUsernameStyle usernameStyle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    // スタイルに応じた値を設定
    final fontSize =
        usernameStyle == _PhotoCardUsernameStyle.large ? 11.0 : 10.0;
    final avatarSize =
        usernameStyle == _PhotoCardUsernameStyle.large ? 22.0 : 18.0;
    final gap =
        usernameStyle == _PhotoCardUsernameStyle.large ? 6.0 : 4.0;
    final padding =
        usernameStyle == _PhotoCardUsernameStyle.large ? 10.0 : 8.0;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // 背景写真（現在はプレースホルダー）
          Positioned.fill(
            child: Container(
              color: backgroundColor,
            ),
          ),
          // ユーザー情報オーバーレイ
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // アバター
                Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    color: avatarColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: gap),
                // ユーザー名
                Text(
                  username,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: fontSize,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
