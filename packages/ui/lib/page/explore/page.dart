import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component/search_bar/search_bar.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/explore/component/anime_list_section/anime_list_section.dart';
import 'package:ui/page/explore/component/community_pilgrimage_section/community_pilgrimage_section.dart';
import 'package:ui/page/explore/component/pilgrimage_ranking_section/pilgrimage_ranking_section.dart'
    show PilgrimageRankingSection, mockRankingData;
import 'package:ui/page/explore/component/recent_reviews_section/recent_reviews_section.dart';
import 'package:ui/page/explore/component/recommended_spots_section/recommended_spots_section.dart';
import 'package:ui/page/explore/component/trending_anime_section/trending_anime_section.dart';
import 'package:ui/page/explore/viewmodel.dart';

class ExplorePage extends HookWidget {
  const ExplorePage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final ExplorePageState state;
  final void Function(ExplorePageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return ColoredBox(
      color: colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            // ヘッダー
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '発見',
                    style: textTheme.headlineMedium?.copyWith(
                      letterSpacing: -0.5,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onEvent(
                      const ExplorePageEvent.notificationButtonTapped(),
                    ),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withValues(alpha: 0.03),
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: colorScheme.onSurface,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // コンテンツ
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 検索バー
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AppSearchBar(
                        onTap: () =>
                            onEvent(const ExplorePageEvent.searchBarTapped()),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // 話題の作品
                    const TrendingAnimeSection(),
                    const SizedBox(height: 32),
                    // 巡礼ランキング
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PilgrimageRankingSection(
                        rankings: mockRankingData,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // 最近のレビュー
                    const RecentReviewsSection(),
                    const SizedBox(height: 32),
                    // みんなの巡礼
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: CommunityPilgrimageSection(),
                    ),
                    const SizedBox(height: 32),
                    // おすすめ聖地
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: RecommendedSpotsSection(),
                    ),
                    const SizedBox(height: 32),
                    // 作品から探す
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: AnimeListSection(),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
