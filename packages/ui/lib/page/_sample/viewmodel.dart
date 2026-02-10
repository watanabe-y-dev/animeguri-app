import 'dart:async';

import 'package:domain/model/_sample/sample.dart';
import 'package:domain/notifier/_sample/sample_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class SamplePageViewModel extends _$SamplePageViewModel {
  @override
  Future<SamplePageState> build() async {
    final samples = await ref.watch(sampleProvider.future);
    return SamplePageState(
      samples: samples,
      effect: const SamplePageEffect.none(),
    );
  }

  void onAction(SamplePageAction action) {
    action.when(
      tapAddButton: () => _addSample().ignore(),
    );
  }

  void _effect(SamplePageEffect effect) {
    ref.read(samplePageEffectEmitterProvider.notifier).onEffect(effect);
  }

  Future<void> _addSample() async {
    try {
      await ref.read(sampleProvider.notifier).add();
      _effect(
        const SamplePageEffect.showSuccessToast(
          message: 'Sample added successfully',
        ),
      );
    } on Exception catch (_) {
      _effect(
        const SamplePageEffect.showErrorToast(message: 'Failed to add sample'),
      );
    }
  }
}

@riverpod
class SamplePageEffectEmitter extends _$SamplePageEffectEmitter {
  @override
  SamplePageEffect build() {
    return const SamplePageEffect.none();
  }

  // ignore: use_setters_to_change_properties
  void onEffect(SamplePageEffect effect) {
    state = effect;
  }

  void reset() {
    state = const SamplePageEffect.none();
  }
}
