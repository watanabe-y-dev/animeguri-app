import 'package:flutter/material.dart';
import 'package:ui/component/anime_badge/anime_badge.dart';
import 'package:ui/component/section/section_header.dart';

/// 作品から探すセクション
///
/// アニメバッジをグリッド状に表示するセクションコンポーネント
class AnimeListSection extends StatelessWidget {
  const AnimeListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: '作品から探す',
      actionLabel: 'すべて',
      onActionTap: () {
        // TODO: 全アニメ一覧画面への遷移
      },
      child: const _BadgeGrid(),
    );
  }
}

class _BadgeGrid extends StatelessWidget {
  const _BadgeGrid();

  static const _mockAnimeData = [
    ('ゆるキャン△', 12),
    ('呪術廻戦', 8),
    ('推しの子', 15),
    ('SPY×FAMILY', 10),
    ('鬼滅の刃', 20),
    ('チェンソーマン', 7),
    ('葬送のフリーレン', 14),
    ('薬屋のひとりごと', 9),
    ('僕のヒーローアカデミア', 18),
    ('東京リベンジャーズ', 11),
    ('進撃の巨人', 16),
    ('ワンピース', 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _mockAnimeData
          .map(
            (anime) => AnimeBadge(
              name: anime.$1,
              count: anime.$2,
            ),
          )
          .toList(),
    );
  }
}
