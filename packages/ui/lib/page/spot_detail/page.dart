import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/spot_detail/component/action_buttons_section.dart';
import 'package:ui/page/spot_detail/component/description_section.dart';
import 'package:ui/page/spot_detail/component/hero_section.dart';
import 'package:ui/page/spot_detail/component/hours_section.dart';
import 'package:ui/page/spot_detail/component/map_section.dart';
import 'package:ui/page/spot_detail/component/nearby_spots_section.dart';
import 'package:ui/page/spot_detail/component/review_summary_section.dart';
import 'package:ui/page/spot_detail/component/spot_info_section.dart';
import 'package:ui/page/spot_detail/viewmodel.dart';

class SpotDetailPage extends HookWidget {
  const SpotDetailPage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final SpotDetailPageState state;
  final void Function(SpotDetailPageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return ColoredBox(
      color: colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ヒーローイメージ
            HeroSection(
              imageUrl:
                  'https://images.unsplash.com/photo-1728200696193-e2a4a36cb93b?w=1080',
              onBackTap: () =>
                  onEvent(const SpotDetailPageEvent.backButtonTapped()),
              onShareTap: () =>
                  onEvent(const SpotDetailPageEvent.shareButtonTapped()),
            ),
            // スポット情報
            SpotInfoSection(
              spotName: '飛騨古川駅',
              category: '駅',
              animeName: '君の名は。',
              animeSpotCount: 12,
              address: '岐阜県飛騨市古川町金森町',
              visitorCount: '1,247',
              rating: '4.5',
              reviewCount: '89',
              onBookmarkTap: () =>
                  onEvent(const SpotDetailPageEvent.bookmarkButtonTapped()),
            ),
            // アクションボタン
            ActionButtonsSection(
              onCheckinTap: () =>
                  onEvent(const SpotDetailPageEvent.checkinButtonTapped()),
              onRouteTap: () =>
                  onEvent(const SpotDetailPageEvent.routeButtonTapped()),
            ),
            // 区切り
            const SectionDivider(),
            // 作品との関連
            DescriptionSection(
              animeTitle: '君の名は。',
              animeEpisode: '劇中でのシーンに登場',
              animeThumbnailUrl:
                  'https://images.unsplash.com/photo-1769847780887-dc6f4380621e?w=1080',
              description:
                  '映画「君の名は。」で主人公の瀧が降り立った'
                  'シーンのモデルとなった駅。'
                  '作中では飛騨の古い町並みを象徴する場所として描かれ、'
                  '聖地巡礼の人気スポットとなっている。'
                  '駅舎のレトロな雰囲気はファンの間で特に人気が高い。',
              onAnimeReferenceTap: () =>
                  onEvent(const SpotDetailPageEvent.animeReferenceTapped()),
            ),
            // 区切り
            const SectionDivider(),
            // 営業情報
            const HoursSection(
              isOpen: true,
              hours: [
                HourEntry(dayLabel: '月〜金', time: '5:30 - 22:30'),
                HourEntry(dayLabel: '土日・祝', time: '5:30 - 22:30'),
              ],
            ),
            // 区切り
            const SectionDivider(),
            // アクセス
            MapSection(
              mapImageUrl:
                  'https://images.unsplash.com/photo-1761077825142-618a9d65f190?w=1080',
              distance: '現在地から約 2.3km',
              onOpenMapTap: () =>
                  onEvent(const SpotDetailPageEvent.openMapTapped()),
            ),
            // 区切り
            const SectionDivider(),
            // レビュー
            ReviewSummarySection(
              averageRating: 4.5,
              reviewCount: 89,
              ratingDistribution: const [5, 10, 25, 50, 80],
              reviews: const [
                ReviewData(
                  userName: 'アニメ巡礼マスター',
                  timeAgo: '2 日前',
                  rating: 5,
                  comment:
                      'アニメで見たそのままの景色が広がっていて感動しました！'
                      '朝早く行くと人も少なくて写真も撮りやすいです。'
                      '近くのカフェでコラボメニューもあって大満足でした。',
                  spotName: '須賀神社の階段',
                  animeName: '君の名は。',
                ),
                ReviewData(
                  userName: '聖地巡礼初心者',
                  timeAgo: '1 週間前',
                  rating: 4,
                  comment:
                      '初めての聖地巡礼でしたが、'
                      'アプリのおかげで迷わずたどり着けました。'
                      '実際の場所とアニメのシーンを'
                      '見比べられるのが楽しかったです！',
                  spotName: '竹原町並み保存地区',
                  animeName: 'たまゆら',
                ),
                ReviewData(
                  userName: '旅行好きオタク',
                  timeAgo: '3 週間前',
                  rating: 3,
                  comment:
                      '景色は素晴らしかったですが、'
                      '週末は観光客が多くてゆっくり見られませんでした。'
                      '平日に行くのがおすすめです。'
                      '駐車場も少し離れた場所にあります。',
                  spotName: '鷲宮神社',
                  animeName: 'らき☆すた',
                ),
              ],
              onSeeAllTap: () =>
                  onEvent(const SpotDetailPageEvent.reviewSeeAllTapped()),
            ),
            // 区切り
            const SectionDivider(),
            // 近くの聖地
            NearbySpotsSection(
              spots: const [
                NearbySpotData(
                  name: '気多若宮神社',
                  animeName: '君の名は。',
                  imageUrl:
                      'https://images.unsplash.com/photo-1758435262247-c55edd053116?w=1080',
                  badge: SpotBadgeType.newSpot,
                ),
                NearbySpotData(
                  name: '飛騨市図書館',
                  animeName: '君の名は。',
                  imageUrl:
                      'https://images.unsplash.com/photo-1758435262247-c55edd053116?w=1080',
                  badge: SpotBadgeType.trending,
                ),
                NearbySpotData(
                  name: '宮川落合バス停',
                  animeName: '君の名は。',
                  imageUrl:
                      'https://images.unsplash.com/photo-1758435262247-c55edd053116?w=1080',
                  badge: SpotBadgeType.popular,
                ),
              ],
              onSpotTap: (index) => onEvent(
                SpotDetailPageEvent.nearbySpotTapped(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
