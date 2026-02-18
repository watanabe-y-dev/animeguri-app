import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/component/notification_button/notification_button.dart';
import 'package:ui/component/search_bar/search_bar.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/explore/component/anime_list_section.dart';
import 'package:ui/page/explore/component/community_spot_section.dart';
import 'package:ui/page/explore/component/recent_reviews_section.dart';
import 'package:ui/page/explore/component/recommended_spots_section.dart';
import 'package:ui/page/explore/component/spot_ranking_section.dart'
    show SpotRankingSection, mockRankingData;
import 'package:ui/page/explore/component/trending_anime_section.dart';
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

    return ColoredBox(
      color: colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            // ヘッダー（検索バー + 通知ボタン）
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  Expanded(
                    child: AppSearchBar(
                      onTap: () => onEvent(
                        const ExplorePageEvent.searchBarTapped(),
                      ),
                    ),
                  ),
                  const Gap(12),
                  NotificationButton(
                    onPressed: () => onEvent(
                      const ExplorePageEvent.notificationButtonTapped(),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            // コンテンツ
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // おすすめ聖地
                    RecommendedSpotsSection(
                      onSeeAllTap: () => onEvent(
                        const ExplorePageEvent
                            .recommendedSpotsSectionActionTapped(),
                      ),
                    ),
                    const Gap(32),
                    // 話題の作品
                    TrendingAnimeSection(
                      onSeeAllTap: () => onEvent(
                        const ExplorePageEvent.animeListSectionActionTapped(),
                      ),
                    ),
                    const Gap(32),
                    // 巡礼ランキング
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SpotRankingSection(
                        rankings: mockRankingData,
                      ),
                    ),
                    const Gap(32),
                    // 最近のレビュー
                    RecentReviewsSection(
                      onActionTap: () => onEvent(
                        const ExplorePageEvent.reviewsSectionActionTapped(),
                      ),
                    ),
                    const Gap(32),
                    // みんなの巡礼
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CommunitySpotSection(
                        onActionTap: () => onEvent(
                          const ExplorePageEvent
                              .communitySpotSectionActionTapped(),
                        ),
                      ),
                    ),
                    const Gap(32),
                    // 作品から探す
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AnimeListSection(
                        onActionTap: () => onEvent(
                          const ExplorePageEvent.animeListSectionActionTapped(),
                        ),
                      ),
                    ),
                    const Gap(32),
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
