import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class ExplorePageViewModel extends _$ExplorePageViewModel
    implements ViewModelBase<ExplorePageEvent, ExplorePageEffect> {
  @override
  ExplorePageState build() {
    return const ExplorePageState();
  }

  @override
  void onEvent(ExplorePageEvent event) {
    event.when(
      searchBarTapped: () =>
          effect(const ExplorePageEffect.navigateToSearch()),
      notificationButtonTapped: () =>
          effect(const ExplorePageEffect.navigateToNotifications()),
    );
  }

  @override
  void effect(ExplorePageEffect effect) {
    ref.read(explorePageEffectEmitterProvider.notifier).onEffect(effect);
  }
}

final explorePageEffectEmitterProvider =
    NotifierProvider<EffectEmitter<ExplorePageEffect>, ExplorePageEffect>(
  () => EffectEmitter(const ExplorePageEffect.none()),
);
