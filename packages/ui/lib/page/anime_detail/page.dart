import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component/back_button/back_button.dart'
    as app_back_button;
import 'package:ui/component/section_divider/section_divider.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/anime_detail/component/description_section.dart';
import 'package:ui/page/anime_detail/component/hero_section.dart';
import 'package:ui/page/anime_detail/component/photo_gallery_section.dart';
import 'package:ui/page/anime_detail/component/review_section.dart';
import 'package:ui/page/anime_detail/component/spot_list_section.dart';
import 'package:ui/page/anime_detail/component/streaming_section.dart';
import 'package:ui/page/anime_detail/viewmodel.dart';

class AnimeDetailPage extends HookWidget {
  const AnimeDetailPage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final AnimeDetailPageState state;
  final void Function(AnimeDetailPageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return ColoredBox(
      color: colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            // AppBar
            ColoredBox(
              color: colorScheme.primaryContainer,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    height: 56,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: app_back_button.BackButton(
                        onPressed: () => onEvent(
                          const AnimeDetailPageEvent
                              .backButtonTapped(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // コンテンツ
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ヒーローセクション
                    HeroSection(
                      title: '君の名は。',
                      subtitle: 'Your Name.',
                      stats: const [
                        HeroStatItem(value: '12', label: '聖地'),
                        HeroStatItem(value: '1,284', label: '巡礼者'),
                        HeroStatItem(value: '156', label: '写真'),
                      ],
                      onOfficialSiteTap: () => onEvent(
                        const AnimeDetailPageEvent.officialSiteTapped(),
                      ),
                      onXLinkTap: () => onEvent(
                        const AnimeDetailPageEvent.xLinkTapped(),
                      ),
                    ),
                    const SectionDivider(),
                    // みんなの写真
                    PhotoGallerySection(
                      photoUrls: const [
                        'https://images.unsplash.com/photo-1572917096570-ba54ba73677c?w=400',
                        'https://images.unsplash.com/photo-1678481965876-33870ab3670b?w=400',
                        'https://images.unsplash.com/photo-1771030669105-170a9b3d70d7?w=400',
                      ],
                      onMoreTap: () => onEvent(
                        const AnimeDetailPageEvent.photoSectionMoreTapped(),
                      ),
                    ),
                    const SectionDivider(),
                    // あらすじ
                    DescriptionSection(
                      description: '東京に暮らす男子高校生・立花瀧と、'
                          '飛騨の山奥に住む女子高校生・宮水三葉。'
                          '出会ったこともない二人が、'
                          'ある日突然お互いの身体が入れ替わる'
                          '不思議な夢を見る。'
                          '戸惑いながらもお互いの生活を'
                          '満喫する二人だったが...',
                      onMoreTap: () => onEvent(
                        const AnimeDetailPageEvent.descriptionMoreTapped(),
                      ),
                    ),
                    const SectionDivider(),
                    // 配信情報
                    StreamingSection(
                      platforms: const [
                        StreamingPlatform(
                          name: 'Netflix',
                          iconText: 'N',
                          iconColor: Color(0xFFE6322E),
                          planType: '見放題',
                        ),
                        StreamingPlatform(
                          name: 'U-NEXT',
                          iconText: 'U',
                          iconColor: Color(0xFF0070D1),
                          planType: '見放題',
                        ),
                        StreamingPlatform(
                          name: 'Prime Video',
                          iconText: 'P',
                          iconColor: Color(0xFF00A8E1),
                          planType: 'レンタル \u00a5400',
                        ),
                      ],
                      onPlatformTap: (name) => onEvent(
                        AnimeDetailPageEvent.streamingPlatformTapped(
                          platformName: name,
                        ),
                      ),
                    ),
                    const SectionDivider(),
                    // 聖地スポット
                    SpotListSection(
                      spots: const [
                        SpotItem(
                          id: '1',
                          name: '飛騨古川駅',
                          category: '駅舎',
                          imageUrl:
                              'https://images.unsplash.com/photo-1761662826376-1750908e66de?w=400',
                          isNew: true,
                        ),
                        SpotItem(
                          id: '2',
                          name: '気多若宮神社',
                          category: '神社',
                          imageUrl:
                              'https://images.unsplash.com/photo-1766150081858-b9696f6f4bd4?w=400',
                          isNew: true,
                        ),
                        SpotItem(
                          id: '3',
                          name: '落合橋',
                          category: '橋',
                          imageUrl:
                              'https://images.unsplash.com/photo-1760456309390-d598c75c592e?w=400',
                        ),
                        SpotItem(
                          id: '4',
                          name: '飛騨市図書館',
                          category: '図書館',
                          imageUrl:
                              'https://images.unsplash.com/photo-1666593823687-c2e2101a33c5?w=400',
                        ),
                      ],
                      onSpotTap: (spotId) => onEvent(
                        AnimeDetailPageEvent.spotTapped(spotId: spotId),
                      ),
                      onMoreTap: () => onEvent(
                        const AnimeDetailPageEvent.spotSectionMoreTapped(),
                      ),
                    ),
                    const SectionDivider(),
                    // レビュー
                    ReviewSection(
                      reviews: const [
                        ReviewItem(
                          userName: '聖地巡礼ガチ勢',
                          timeAgo: '3 日前',
                          rating: 5,
                          comment: '聖地巡礼のきっかけになった作品。'
                              '実際に訪れると作中の雰囲気が'
                              'そのまま感じられて最高でした。'
                              'ファンなら絶対に行くべき!',
                          spotName: '飛騨高山',
                          animeName: '氷菓',
                        ),
                        ReviewItem(
                          userName: 'アニメ旅行好き',
                          timeAgo: '1 週間前',
                          rating: 4,
                          comment: '背景の描写が美しく、'
                              '聖地巡礼マップを見ながら回ると'
                              '新しい発見がたくさんありました。'
                              '地元の方も親切で'
                              '温かい気持ちになれます。',
                          spotName: '須賀神社',
                          animeName: '君の名は。',
                        ),
                        ReviewItem(
                          userName: '写真好きトラベラー',
                          timeAgo: '2 週間前',
                          rating: 4,
                          comment: '聖地の数が多いので'
                              '一日では回りきれませんでした。'
                              'エリアごとに分けて何回かに分けて'
                              '巡るのがおすすめです。'
                              '次回はもっとゆっくり回りたい。',
                          spotName: '諏訪湖',
                          animeName: '君の名は。',
                        ),
                      ],
                      onMoreTap: () => onEvent(
                        const AnimeDetailPageEvent.reviewSectionMoreTapped(),
                      ),
                    ),
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
