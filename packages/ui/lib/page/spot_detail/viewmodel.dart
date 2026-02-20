import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class SpotDetailPageViewModel extends _$SpotDetailPageViewModel
    implements ViewModelBase<SpotDetailPageEvent, SpotDetailPageEffect> {
  @override
  SpotDetailPageState build() {
    return const SpotDetailPageState();
  }

  @override
  void onEvent(SpotDetailPageEvent event) {
    event.when(
      backButtonTapped: () =>
          effect(const SpotDetailPageEffect.navigateBack()),
      shareButtonTapped: () =>
          effect(const SpotDetailPageEffect.shareSpot()),
      bookmarkButtonTapped: () {},
      checkinButtonTapped: () {},
      routeButtonTapped: () =>
          effect(const SpotDetailPageEffect.openRouteNavigation()),
      animeReferenceTapped: () =>
          effect(const SpotDetailPageEffect.navigateToAnimeDetail()),
      openMapTapped: () =>
          effect(const SpotDetailPageEffect.openMapApp()),
      reviewSeeAllTapped: () =>
          effect(const SpotDetailPageEffect.navigateToReviews()),
      nearbySpotTapped: (index) {},
    );
  }

  @override
  void effect(SpotDetailPageEffect effect) {
    ref.read(spotDetailPageEffectEmitterProvider.notifier).onEffect(effect);
  }
}

final spotDetailPageEffectEmitterProvider =
    NotifierProvider<EffectEmitter<SpotDetailPageEffect>, SpotDetailPageEffect>(
  () => EffectEmitter(const SpotDetailPageEffect.none()),
);
