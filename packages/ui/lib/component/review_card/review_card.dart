import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    required this.spotName,
    required this.animeName,
  });

  final String avatarUrl;
  final String userName;
  final String timeAgo;
  final int rating;
  final String comment;
  final String spotName;
  final String animeName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 12,
            color: colorScheme.shadow.withValues(alpha: 0.03),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(
              avatarUrl: avatarUrl,
              userName: userName,
              timeAgo: timeAgo,
            ),
            const SizedBox(height: 12),
            _StarRating(rating: rating),
            const SizedBox(height: 12),
            _Comment(comment: comment),
            const SizedBox(height: 12),
            _SpotInfo(
              spotName: spotName,
              animeName: animeName,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.avatarUrl,
    required this.userName,
    required this.timeAgo,
  });

  final String avatarUrl;
  final String userName;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            avatarUrl,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 32,
              height: 32,
              color: colorScheme.outlineVariant,
              child: Icon(
                Icons.person,
                size: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                timeAgo,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StarRating extends StatelessWidget {
  const _StarRating({required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
          child: Icon(
            LucideIcons.star,
            size: 14,
            color: index < rating
                ? const Color(0xFFF5A623)
                : colorScheme.outlineVariant,
          ),
        );
      }),
    );
  }
}

class _Comment extends StatelessWidget {
  const _Comment({required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Text(
      comment,
      style: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: colorScheme.onSurfaceVariant,
        height: 1.5,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _SpotInfo extends StatelessWidget {
  const _SpotInfo({
    required this.spotName,
    required this.animeName,
  });

  final String spotName;
  final String animeName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            LucideIcons.mapPin,
            size: 12,
            color: Color(0xFF3D8A5A),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              '$spotName・$animeName',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: colorScheme.onSurfaceVariant,
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
