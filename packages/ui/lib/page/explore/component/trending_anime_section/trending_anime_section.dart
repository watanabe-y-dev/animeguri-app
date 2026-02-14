import 'package:flutter/material.dart';
import 'package:ui/component/anime_card/anime_card.dart';
import 'package:ui/component/section/section.dart';

/// 話題の作品セクション
///
/// 横スクロール可能なアニメカードリストを表示するセクション
class TrendingAnimeSection extends StatelessWidget {
  const TrendingAnimeSection({
    super.key,
    this.onSeeAllTap,
  });

  /// 「すべて」タップ時のコールバック
  final VoidCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '話題の作品',
      actionLabel: 'すべて',
      onActionTap: onSeeAllTap,
      headerPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: _mockAnimeData.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final anime = _mockAnimeData[index];
            return AnimeCard(
              imageUrl: anime.imageUrl,
              title: anime.title,
              pilgrimageCount: anime.pilgrimageCount,
            );
          },
        ),
      ),
    );
  }
}

/// モックデータ用のアニメ情報クラス
class _AnimeData {
  const _AnimeData({
    required this.imageUrl,
    required this.title,
    required this.pilgrimageCount,
  });

  final String imageUrl;
  final String title;
  final int pilgrimageCount;
}

/// モックデータ
const _mockAnimeData = [
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1680613320380-8766ffd8e972',
    title: '東京リベンジャーズ',
    pilgrimageCount: 15,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1723126906987-32a64deb22ac',
    title: '僕のヒーローアカデミア',
    pilgrimageCount: 23,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1762747018723-437e35727353',
    title: 'SPY×FAMILY',
    pilgrimageCount: 18,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1680613320380-8766ffd8e972',
    title: 'ワンピース',
    pilgrimageCount: 42,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1723126906987-32a64deb22ac',
    title: '鬼滅の刃',
    pilgrimageCount: 38,
  ),
];
