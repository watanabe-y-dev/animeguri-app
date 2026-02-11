import 'dart:async';

import 'package:domain/model/_sample/sample.dart';
import 'package:domain/notifier/_sample/sample_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/effect_emitter_base.dart';
import 'package:ui/core/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class SamplePageViewModel extends _$SamplePageViewModel
    implements ViewModelBase<SamplePageEvent, SamplePageEffect> {
  @override
  Future<SamplePageState> build() async {
    final samples = await ref.watch(sampleProvider.future);
    return SamplePageState(
      samples: samples,
    );
  }

  @override
  void onEvent(SamplePageEvent event) {
    event.when(
      addButtonTapped: () => _addSample().ignore(),
    );
  }

  @override
  void effect(SamplePageEffect effect) {
    ref.read(samplePageEffectEmitterProvider.notifier).onEffect(effect);
  }

  Future<void> _addSample() async {
    try {
      await ref.read(sampleProvider.notifier).add();
      effect(
        const SamplePageEffect.showSuccessToast(
          message: 'Sample added successfully',
        ),
      );
    } on Exception catch (_) {
      effect(
        const SamplePageEffect.showErrorToast(message: 'Failed to add sample'),
      );
    }
  }
}

@riverpod
class SamplePageEffectEmitter extends _$SamplePageEffectEmitter
    implements EffectEmitterBase<SamplePageEffect> {
  @override
  SamplePageEffect build() {
    return const SamplePageEffect.none();
  }

  @override
  void onEffect(SamplePageEffect effect) {
    state = effect;
  }

  @override
  void reset() {
    state = const SamplePageEffect.none();
  }
}
