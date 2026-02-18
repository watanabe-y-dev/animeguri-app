import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class AnimeListPageViewModel extends _$AnimeListPageViewModel
    implements ViewModelBase<AnimeListPageEvent, AnimeListPageEffect> {
  @override
  AnimeListPageState build() {
    return const AnimeListPageState();
  }

  @override
  void onEvent(AnimeListPageEvent event) {
    event.when(
      backButtonTapped: () =>
          effect(const AnimeListPageEffect.navigateBack()),
      searchBarTapped: () =>
          effect(const AnimeListPageEffect.navigateToSearch()),
      filterChipSelected: (filter) {
        state = state.copyWith(selectedFilter: filter);
      },
      animeCardTapped: (animeId) =>
          effect(AnimeListPageEffect.navigateToAnimeDetail(animeId: animeId)),
    );
  }

  @override
  void effect(AnimeListPageEffect effect) {
    ref.read(animeListPageEffectEmitterProvider.notifier).onEffect(effect);
  }
}

final animeListPageEffectEmitterProvider =
    NotifierProvider<EffectEmitter<AnimeListPageEffect>, AnimeListPageEffect>(
  () => EffectEmitter(const AnimeListPageEffect.none()),
);
