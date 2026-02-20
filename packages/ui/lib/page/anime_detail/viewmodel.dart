import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class AnimeDetailPageViewModel extends _$AnimeDetailPageViewModel
    implements ViewModelBase<AnimeDetailPageEvent, AnimeDetailPageEffect> {
  @override
  AnimeDetailPageState build() {
    return const AnimeDetailPageState();
  }

  @override
  void onEvent(AnimeDetailPageEvent event) {
    event.when(
      backButtonTapped: () =>
          effect(const AnimeDetailPageEffect.navigateBack()),
      officialSiteTapped: () {},
      xLinkTapped: () {},
      photoSectionMoreTapped: () {},
      descriptionMoreTapped: () {},
      streamingPlatformTapped: (name) {},
      spotTapped: (spotId) {},
      spotSectionMoreTapped: () {},
      reviewSectionMoreTapped: () {},
    );
  }

  @override
  void effect(AnimeDetailPageEffect effect) {
    ref.read(animeDetailPageEffectEmitterProvider.notifier).onEffect(effect);
  }
}

final animeDetailPageEffectEmitterProvider = NotifierProvider<
    EffectEmitter<AnimeDetailPageEffect>, AnimeDetailPageEffect>(
  () => EffectEmitter(const AnimeDetailPageEffect.none()),
);
