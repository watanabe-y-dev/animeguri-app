import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/community_spot/viewmodel.dart';

class CommunitySpotPage extends HookWidget {
  const CommunitySpotPage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final CommunitySpotPageState state;
  final void Function(CommunitySpotPageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return ColoredBox(
      color: colorScheme.surface,
      child: Column(
        children: [
          // ヘッダー
          _Header(
            onBackTap: () => onEvent(
              const CommunitySpotPageEvent.backButtonTapped(),
            ),
          ),
          // フィルターチップ
          _FilterChips(
            selectedFilter: state.selectedFilter,
            onFilterSelected: (filter) => onEvent(
              CommunitySpotPageEvent.filterSelected(filter),
            ),
          ),
          // 写真グリッド
          Expanded(
            child: _PhotoGrid(
              posts: state.posts,
              onPostTap: (postId) => onEvent(
                CommunitySpotPageEvent.postTapped(postId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ヘッダー
class _Header extends HookWidget {
  const _Header({required this.onBackTap});

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBackTap,
              child: Icon(
                Icons.chevron_left,
                size: 24,
                color: colorScheme.onSurface,
              ),
            ),
            const Gap(12),
            Expanded(
              child: Text(
                'みんなの巡礼',
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(12),
            const SizedBox(width: 24, height: 24),
          ],
        ),
      ),
    );
  }
}

/// フィルターチップ
class _FilterChips extends HookWidget {
  const _FilterChips({
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  final CommunitySpotFilter selectedFilter;
  final ValueChanged<CommunitySpotFilter> onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: CommunitySpotFilter.values.map((filter) {
          final isSelected = filter == selectedFilter;
          return Padding(
            padding: EdgeInsets.only(
              right: filter != CommunitySpotFilter.values.last ? 8 : 0,
            ),
            child: _FilterChip(
              label: filter.label,
              isSelected: isSelected,
              onTap: () => onFilterSelected(filter),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// 個々のフィルターチップ
class _FilterChip extends HookWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(100),
          border: isSelected
              ? null
              : Border.all(color: colorScheme.outlineVariant),
        ),
        child: Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? colorScheme.onPrimary
                : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

/// 写真グリッド（2 カラム Masonry レイアウト）
class _PhotoGrid extends HookWidget {
  const _PhotoGrid({
    required this.posts,
    required this.onPostTap,
  });

  final List<CommunitySpotPost> posts;
  final ValueChanged<String> onPostTap;

  @override
  Widget build(BuildContext context) {
    // 左右のカラムに振り分け（偶数インデックスが左、奇数が右）
    final leftPosts = <CommunitySpotPost>[];
    final rightPosts = <CommunitySpotPost>[];
    for (var i = 0; i < posts.length; i++) {
      if (i.isEven) {
        leftPosts.add(posts[i]);
      } else {
        rightPosts.add(posts[i]);
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  for (final post in leftPosts) ...[
                    _PostCard(
                      post: post,
                      onTap: () => onPostTap(post.id),
                    ),
                    const Gap(8),
                  ],
                ],
              ),
            ),
            const Gap(8),
            Expanded(
              child: Column(
                children: [
                  for (final post in rightPosts) ...[
                    _PostCard(
                      post: post,
                      onTap: () => onPostTap(post.id),
                    ),
                    const Gap(8),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 投稿カード
class _PostCard extends HookWidget {
  const _PostCard({
    required this.post,
    required this.onTap,
  });

  final CommunitySpotPost post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 写真カード
          Container(
            height: post.imageHeight,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                // 背景プレースホルダー
                Positioned.fill(
                  child: ColoredBox(
                    color: colorScheme.surfaceContainerHigh,
                  ),
                ),
                // グラデーションオーバーレイ + ユーザー情報
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x00000000),
                          Color(0x66000000),
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          post.username,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // スポット名・アニメ名
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 2, 4, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.spotName,
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const Gap(2),
                Text(
                  post.animeName,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: colorScheme.onSurfaceVariant,
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
