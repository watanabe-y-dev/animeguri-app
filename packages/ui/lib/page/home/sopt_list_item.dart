import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component/space/space.dart';
import 'package:ui/component/text/body.dart';
import 'package:ui/component/text/title.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

class SpotListItem extends HookWidget {
  const SpotListItem({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.commentCount,
    required this.visitedCount,
    required this.bookmarkCount,
  });

  final String title;
  final String description;
  final List<String> images;
  final int commentCount;
  final int visitedCount;
  final int bookmarkCount;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 画像表示部分
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              images.isNotEmpty ? images.first : '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => ColoredBox(
                color: theme.colorScheme.surfaceContainer,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space.sm(),
            // タイトル
            TitleSmall(
              title,
              color: theme.colorScheme.onSurface,
            ),
            const Space.sm(),
            // 説明文
            BodySmall(
              description,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const Space.sm(),
            // 統計情報
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildStatItem(
                    Icons.chat_bubble_outline,
                    commentCount.toString(),
                    theme,
                  ),
                  const Space.md(),
                  _buildStatItem(
                    Icons.people_outline,
                    visitedCount.toString(),
                    theme,
                  ),
                  const Space.md(),
                  _buildStatItem(
                    Icons.bookmark_border,
                    bookmarkCount.toString(),
                    theme,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String count, AppThemeData theme) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const Space.xs(),
        BodySmall(
          count,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ],
    );
  }
}
