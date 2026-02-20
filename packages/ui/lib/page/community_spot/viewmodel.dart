import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

/// モックデータ
const mockCommunitySpotPosts = [
  CommunitySpotPost(
    id: '1',
    username: '@sakura_trip',
    spotName: '秩父神社',
    animeName: 'あの花が咲く丘の上で',
    imageHeight: 240,
  ),
  CommunitySpotPost(
    id: '2',
    username: '@anime_fan',
    spotName: '鎌倉高校前踏切',
    animeName: 'スラムダンク',
    imageHeight: 180,
  ),
  CommunitySpotPost(
    id: '3',
    username: '@seichi_go',
    spotName: '河口湖',
    animeName: 'ゆるキャン△',
    imageHeight: 220,
  ),
  CommunitySpotPost(
    id: '4',
    username: '@onsen_lover',
    spotName: '湯涌温泉',
    animeName: '花咲くいろは',
    imageHeight: 180,
  ),
  CommunitySpotPost(
    id: '5',
    username: '@night_walker',
    spotName: '新宿御苑',
    animeName: '言の葉の庭',
    imageHeight: 200,
  ),
  CommunitySpotPost(
    id: '6',
    username: '@nara_deer',
    spotName: '奈良公園',
    animeName: '鹿の王',
    imageHeight: 200,
  ),
];

@riverpod
class CommunitySpotPageViewModel
    extends _$CommunitySpotPageViewModel
    implements
        ViewModelBase<CommunitySpotPageEvent,
            CommunitySpotPageEffect> {
  @override
  Future<CommunitySpotPageState> build() async {
    return const CommunitySpotPageState(
      posts: mockCommunitySpotPosts,
      selectedFilter: CommunitySpotFilter.all,
    );
  }

  @override
  void onEvent(CommunitySpotPageEvent event) {
    event.when(
      backButtonTapped: () =>
          effect(const CommunitySpotPageEffect.navigateBack()),
      filterSelected: _selectFilter,
      postTapped: (_) {},
    );
  }

  @override
  void effect(CommunitySpotPageEffect effect) {
    ref
        .read(communitySpotPageEffectEmitterProvider.notifier)
        .onEffect(effect);
  }

  void _selectFilter(CommunitySpotFilter filter) {
    final previous = state;
    if (previous is! AsyncData<CommunitySpotPageState>) return;
    state = AsyncData(previous.value.copyWith(selectedFilter: filter));
  }
}

final communitySpotPageEffectEmitterProvider = NotifierProvider<
    EffectEmitter<CommunitySpotPageEffect>,
    CommunitySpotPageEffect>(
  () => EffectEmitter(const CommunitySpotPageEffect.none()),
);
