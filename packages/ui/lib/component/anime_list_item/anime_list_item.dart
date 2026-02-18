import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';

/// アニメ作品のリストアイテム
///
/// 作品のサムネイル、タイトル、聖地数、バッジを表示するリストアイテム
class AnimeListItem extends HookWidget {
  const AnimeListItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.spotCount,
    this.badge,
    this.showBottomBorder = true,
    this.onTap,
  });

  /// サムネイル画像の URL
  final String imageUrl;

  /// 作品タイトル
  final String title;

  /// 聖地数
  final int spotCount;

  /// バッジテキスト（例: "人気", "話題", "新着"）
  final String? badge;

  /// 下部ボーダーを表示するかどうか
  final bool showBottomBorder;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          border: showBottomBorder
              ? Border(
                  bottom: BorderSide(
                    color: colorScheme.outlineVariant,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            // サムネイル
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 56,
                height: 56,
                color: colorScheme.surfaceContainerHighest,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: colorScheme.surfaceContainerHighest,
                    );
                  },
                ),
              ),
            ),
            const Gap(14),
            // 情報
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Text(
                        '$spotCount 聖地',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (badge != null) ...[
                        const Gap(6),
                        Text(
                          '・',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                        const Gap(6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            badge!,
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
