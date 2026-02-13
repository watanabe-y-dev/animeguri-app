import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/core/widget/text/label.dart';
import 'package:ui/core/widget/text/title.dart';
import 'package:ui/hook/app_theme.dart';

class RankingListItem extends HookWidget {
  const RankingListItem({
    super.key,
    required this.rank,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.unit,
    this.thumbnailUrl,
  });

  final int rank;
  final String title;
  final String subtitle;
  final int count;
  final String unit;
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
              child: _ItemInfo(
                title: title,
                subtitle: subtitle,
              ),
            ),
            const Gap(12),
            _CountInfo(count: count, unit: unit),
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
    return SizedBox(
      width: 28,
      height: 28,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _backgroundColor(colorScheme),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: TextLabel.medium(
            '$rank',
            color: _textColor(colorScheme),
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
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

class _ItemInfo extends HookWidget {
  const _ItemInfo({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextTitle.small(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(2),
        TextLabel.small(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _CountInfo extends HookWidget {
  const _CountInfo({
    required this.count,
    required this.unit,
  });

  final int count;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextTitle.medium('$count'),
        const Gap(2),
        TextLabel.small(unit),
      ],
    );
  }
}
