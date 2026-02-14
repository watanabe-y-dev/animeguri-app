import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';

class PilgrimageRankingListItem extends HookWidget {
  const PilgrimageRankingListItem({
    super.key,
    required this.rank,
    required this.spotName,
    required this.animeName,
    required this.visitCount,
    this.thumbnailUrl,
  });

  final int rank;
  final String spotName;
  final String animeName;
  final int visitCount;
  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          children: [
            _RankBadge(rank: rank),
            const Gap(12),
            _Thumbnail(url: thumbnailUrl),
            const Gap(12),
            Expanded(
              child: _SpotInfo(
                spotName: spotName,
                animeName: animeName,
              ),
            ),
            const Gap(12),
            _VisitCount(count: visitCount),
          ],
        ),
      ),
    );
  }
}

class _RankBadge extends HookWidget {
  const _RankBadge({required this.rank});

  final int rank;

  Color _backgroundColor(ColorScheme colorScheme) {
    return switch (rank) {
      1 => const Color(0xFFFFD700),
      2 => const Color(0xFFC0C0C0),
      3 => const Color(0xFFCD7F32),
      _ => colorScheme.outlineVariant,
    };
  }

  Color _textColor(ColorScheme colorScheme) {
    return switch (rank) {
      1 || 2 || 3 => Colors.white,
      _ => colorScheme.onSurfaceVariant,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return SizedBox(
      width: 28,
      height: 28,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _backgroundColor(colorScheme),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$rank',
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: _textColor(colorScheme),
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends HookWidget {
  const _Thumbnail({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 44,
        height: 44,
        child: url != null
            ? Image.network(
                url!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const _ThumbnailPlaceholder(),
              )
            : const _ThumbnailPlaceholder(),
      ),
    );
  }
}

class _ThumbnailPlaceholder extends HookWidget {
  const _ThumbnailPlaceholder();

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    return ColoredBox(
      color: colorScheme.outlineVariant,
      child: Center(
        child: Icon(
          Icons.photo_outlined,
          size: 20,
          color: colorScheme.onSurfaceVariant,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          spotName,
          style: textTheme.labelLarge?.copyWith(
            fontSize: 14,
            color: colorScheme.onSurface,
            height: 1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(2),
        Text(
          animeName,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 11,
            color: colorScheme.onSurfaceVariant,
            height: 1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _VisitCount extends HookWidget {
  const _VisitCount({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$count',
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
            height: 1,
          ),
        ),
        const Gap(2),
        Text(
          '訪問',
          style: textTheme.labelSmall?.copyWith(
            fontSize: 10,
            color: colorScheme.onSurfaceVariant,
            height: 1,
          ),
        ),
      ],
    );
  }
}
