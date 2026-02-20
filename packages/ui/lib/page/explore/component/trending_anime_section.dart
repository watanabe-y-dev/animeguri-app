import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component/anime_list_item/anime_list_item.dart';
import 'package:ui/component/section_header/section_header.dart';
import 'package:ui/hook/app_theme.dart';

/// 話題の作品セクション
///
/// ページ単位の横スクロールカルーセルでアニメ作品を表示するセクション
class TrendingAnimeSection extends HookWidget {
  const TrendingAnimeSection({
    super.key,
    this.onSeeAllTap,
  });

  /// 「すべて」タップ時のコールバック
  final VoidCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    // ページ数を計算（1 ページに 3 作品）
    const itemsPerPage = 3;
    final pageCount = (_mockAnimeData.length / itemsPerPage).ceil();

    // アイテムの高さを計算
    const itemHeight = 56.0 + 14.0 + 14.0; // thumbnail + vertical padding
    const borderHeight = 1.0;
    const pageHeight =
        (itemHeight * itemsPerPage) + (borderHeight * (itemsPerPage - 1));

    return SectionHeader(
      title: '話題の作品',
      actionLabel: 'すべて',
      onActionTap: onSeeAllTap,
      headerPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: pageHeight,
        child: PageView.builder(
          itemCount: pageCount,
          controller: PageController(viewportFraction: 0.87),
          itemBuilder: (context, pageIndex) {
            final startIndex = pageIndex * itemsPerPage;
            final endIndex =
                (startIndex + itemsPerPage).clamp(0, _mockAnimeData.length);
            final pageItems = _mockAnimeData.sublist(startIndex, endIndex);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.03),
                      offset: const Offset(0, 2),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    children: List.generate(pageItems.length, (index) {
                      final anime = pageItems[index];
                      final isLastItem = index == pageItems.length - 1;
                      return AnimeListItem(
                        imageUrl: anime.imageUrl,
                        title: anime.title,
                        spotCount: anime.spotCount,
                        badge: anime.badge,
                        showBottomBorder: !isLastItem,
                      );
                    }),
                  ),
                ),
              ),
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
    required this.spotCount,
    this.badge,
  });

  final String imageUrl;
  final String title;
  final int spotCount;
  final String? badge;
}

/// モックデータ
const _mockAnimeData = [
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1752381508952-4b0f3ff8566f',
    title: 'ゆるキャン△',
    spotCount: 12,
    badge: '人気',
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1764057146118-549c495b4ec7',
    title: '花咲くいろは',
    spotCount: 8,
    badge: '話題',
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1768593396716-20cd77c2d15d',
    title: '氷菓',
    spotCount: 6,
    badge: '新着',
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1680613320380-8766ffd8e972',
    title: '東京リベンジャーズ',
    spotCount: 15,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1723126906987-32a64deb22ac',
    title: '僕のヒーローアカデミア',
    spotCount: 23,
    badge: '話題',
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1762747018723-437e35727353',
    title: 'SPY×FAMILY',
    spotCount: 18,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1767961926827-c1e60f22c75c',
    title: '君の名は。',
    spotCount: 31,
    badge: '人気',
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1748066776867-f97cef0efe14',
    title: 'SLAM DUNK',
    spotCount: 14,
  ),
  _AnimeData(
    imageUrl: 'https://images.unsplash.com/photo-1732624206726-9ea82d08f49b',
    title: 'あの日見た花の名前を僕達はまだ知らない。',
    spotCount: 9,
    badge: '新着',
  ),
];
