import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

/// レビュー一覧画面用のレビューリストアイテム
///
/// ユーザー情報、星評価、コメント、スポット情報を縦に並べて表示する。
/// コメントは 3 行でクリップされ、フェードオーバーレイで切れ目を表現する。
class ReviewListItem extends HookWidget {
  const ReviewListItem({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    required this.spotName,
    required this.animeName,
    required this.avatarColor,
    this.onTap,
  });

  final String userName;
  final String timeAgo;
  final int rating;
  final String comment;
  final String spotName;
  final String animeName;
  final Color avatarColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return Material(
      color: colorScheme.surfaceContainerLowest,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserRow(
                userName: userName,
                timeAgo: timeAgo,
                avatarColor: avatarColor,
              ),
              const Gap(12),
              _StarRating(rating: rating),
              const Gap(12),
              _CommentWrap(comment: comment),
              const Gap(12),
              _SpotInfo(
                spotName: spotName,
                animeName: animeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserRow extends HookWidget {
  const _UserRow({
    required this.userName,
    required this.timeAgo,
    required this.avatarColor,
  });

  final String userName;
  final String timeAgo;
  final Color avatarColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: avatarColor,
            shape: BoxShape.circle,
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(2),
              Text(
                timeAgo,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StarRating extends HookWidget {
  const _StarRating({required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < rating;
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
          child: Icon(
            isFilled ? Icons.star_rounded : Icons.star_border_rounded,
            size: 16,
            color: isFilled
                ? const Color(0xFFF5A623)
                : colorScheme.onSurface.withValues(alpha: 0.2),
          ),
        );
      }),
    );
  }
}

class _CommentWrap extends HookWidget {
  const _CommentWrap({required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return SizedBox(
      height: 58,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white.withValues(alpha: 0),
            ],
            stops: const [0.0, 0.5, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Text(
          comment,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
          maxLines: 3,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}

class _SpotInfo extends HookWidget {
  const _SpotInfo({
    required this.spotName,
    required this.animeName,
  });

  final String spotName;
  final String animeName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.mapPin,
            size: 13,
            color: colorScheme.primary,
          ),
          const Gap(6),
          Text(
            spotName,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '\u30FB',
              style: textTheme.labelSmall?.copyWith(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.3),
              ),
            ),
          ),
          Expanded(
            child: Text(
              animeName,
              style: textTheme.labelSmall?.copyWith(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.3),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
