import 'package:flutter/material.dart';
import 'package:ui/component/section_header/section_header.dart';
import 'package:ui/component/spot_banner_card/spot_banner_card.dart';

/// おすすめ聖地セクション
///
/// おすすめの聖地スポットを横スクロールカルーセルで表示するセクション
class RecommendedSpotsSection extends StatelessWidget {
  const RecommendedSpotsSection({
    super.key,
    this.onSeeAllTap,
  });

  /// 「すべて」タップ時のコールバック
  final VoidCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: 'おすすめ聖地',
      actionLabel: 'すべて',
      onActionTap: onSeeAllTap,
      headerPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 180,
        child: PageView.builder(
          itemCount: _mockSpotData.length,
          controller: PageController(viewportFraction: 0.87),
          itemBuilder: (context, index) {
            final spot = _mockSpotData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SpotBannerCard(
                imageUrl: spot.imageUrl,
                spotName: spot.spotName,
                animeName: spot.animeName,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// モックデータ用のスポット情報クラス
class _SpotData {
  const _SpotData({
    required this.spotName,
    required this.animeName,
    required this.imageUrl,
  });

  final String spotName;
  final String animeName;
  final String imageUrl;
}

/// モックデータ
const _mockSpotData = [
  _SpotData(
    spotName: '河口湖大橋',
    animeName: 'ゆるキャン△',
    imageUrl:
        'https://images.unsplash.com/photo-1742078031778-af6ac14d45a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzA4MDA4ODJ8&ixlib=rb-4.1.0&q=80&w=1080',
  ),
  _SpotData(
    spotName: '湯涌温泉',
    animeName: '花咲くいろは',
    imageUrl:
        'https://images.unsplash.com/photo-1596931485386-a248cb9a379f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzA4MDA4ODJ8&ixlib=rb-4.1.0&q=80&w=1080',
  ),
  _SpotData(
    spotName: '千反田邸（加茂荘）',
    animeName: '氷菓',
    imageUrl:
        'https://images.unsplash.com/photo-1616666720355-03ce7f70b237?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzA4MDA4ODN8&ixlib=rb-4.1.0&q=80&w=1080',
  ),
  _SpotData(
    spotName: '武蔵野市桜堤',
    animeName: 'ラブライブ！',
    imageUrl:
        'https://images.unsplash.com/photo-1732192552036-f659db53000d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzA4MDM1NDZ8&ixlib=rb-4.1.0&q=80&w=1080',
  ),
  _SpotData(
    spotName: '飛騨古川駅',
    animeName: '君の名は。',
    imageUrl:
        'https://images.unsplash.com/photo-1633291670637-81c352c8720e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzA4MDM1NDZ8&ixlib=rb-4.1.0&q=80&w=1080',
  ),
];
