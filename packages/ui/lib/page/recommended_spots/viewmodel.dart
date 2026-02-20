import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/component/spot_list_item/spot_list_item.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class RecommendedSpotsPageViewModel extends _$RecommendedSpotsPageViewModel
    implements
        ViewModelBase<RecommendedSpotsPageEvent, RecommendedSpotsPageEffect> {
  @override
  Future<RecommendedSpotsPageState> build() async {
    return RecommendedSpotsPageState(
      spots: _mockSpots,
      filterChips: _mockFilterChips,
      selectedFilterIndex: 0,
      totalCount: _mockSpots.length,
      sortLabel: 'おすすめ順',
    );
  }

  @override
  void onEvent(RecommendedSpotsPageEvent event) {
    event.when(
      filterChipTapped: _onFilterChipTapped,
      sortButtonTapped: () {},
      spotTapped: (spotId) => effect(
        RecommendedSpotsPageEffect.navigateToSpotDetail(spotId: spotId),
      ),
      backButtonTapped: () => effect(
        const RecommendedSpotsPageEffect.navigateBack(),
      ),
    );
  }

  @override
  void effect(RecommendedSpotsPageEffect effect) {
    ref
        .read(recommendedSpotsPageEffectEmitterProvider.notifier)
        .onEffect(effect);
  }

  void _onFilterChipTapped(int index) {
    final current = state;
    if (current is! AsyncData<RecommendedSpotsPageState>) return;
    state = AsyncData(current.value.copyWith(selectedFilterIndex: index));
  }
}

final recommendedSpotsPageEffectEmitterProvider = NotifierProvider<
    EffectEmitter<RecommendedSpotsPageEffect>, RecommendedSpotsPageEffect>(
  () => EffectEmitter(const RecommendedSpotsPageEffect.none()),
);

const _mockFilterChips = [
  FilterChipItem(label: 'すべて'),
  FilterChipItem(label: '新着'),
  FilterChipItem(label: '話題'),
  FilterChipItem(label: '人気'),
  FilterChipItem(label: '関東'),
];

const _mockSpots = [
  SpotItem(
    id: '1',
    spotName: '河口湖大橋',
    animeName: 'ゆるキャン△',
    imageUrl:
        'https://images.unsplash.com/photo-1767127961785-a324466f8039?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDN8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.newSpot,
  ),
  SpotItem(
    id: '2',
    spotName: '湯涌温泉',
    animeName: '花咲くいろは',
    imageUrl:
        'https://images.unsplash.com/photo-1765824649565-33367327800a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDN8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.trending,
  ),
  SpotItem(
    id: '3',
    spotName: '千反田邸（加茂荘）',
    animeName: '氷菓',
    imageUrl:
        'https://images.unsplash.com/photo-1763984326368-0bc8f9f2f597?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDR8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.newSpot,
  ),
  SpotItem(
    id: '4',
    spotName: '秩父橋',
    animeName: 'あの花',
    imageUrl:
        'https://images.unsplash.com/photo-1747143068228-991e3245861f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDR8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.popular,
  ),
  SpotItem(
    id: '5',
    spotName: '竹原町並み保存地区',
    animeName: 'たまゆら',
    imageUrl:
        'https://images.unsplash.com/photo-1762178907403-5e5455104e5a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDR8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.newSpot,
  ),
  SpotItem(
    id: '6',
    spotName: '飛騨高山',
    animeName: '氷菓',
    imageUrl:
        'https://images.unsplash.com/photo-1751004537960-997e56037a1d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDh8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.trending,
  ),
  SpotItem(
    id: '7',
    spotName: '諏訪湖',
    animeName: '君の名は。',
    imageUrl:
        'https://images.unsplash.com/photo-1698907058218-4f1721f54f69?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDh8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.popular,
  ),
  SpotItem(
    id: '8',
    spotName: '鎌倉高校前駅',
    animeName: 'スラムダンク',
    imageUrl:
        'https://images.unsplash.com/photo-1769251296791-b878980fb7e5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDh8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.popular,
  ),
  SpotItem(
    id: '9',
    spotName: '大洗磯前神社',
    animeName: 'ガールズ&パンツァー',
    imageUrl:
        'https://images.unsplash.com/photo-1651910853503-b77731a6e718?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzExMTI4NDl8&ixlib=rb-4.1.0&q=80&w=1080',
    badge: SpotBadgeType.trending,
  ),
];
