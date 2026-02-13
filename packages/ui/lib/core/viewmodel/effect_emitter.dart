import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 汎用的な Effect Emitter
///
/// どんな Effect 型でも使える汎用クラス。
/// NotifierProvider と組み合わせて使用する。
///
/// ## 使い方
///
/// ```dart
/// final samplePageEffectEmitterProvider =
///   NotifierProvider<EffectEmitter<SamplePageEffect>, SamplePageEffect>(
///     () => EffectEmitter(const SamplePageEffect.none()),
///   );
/// ```
///
/// ## 提供されるメソッド
///
/// - [onEffect]: Effect を発行する
/// - [reset]: Effect を初期値にリセットする
class EffectEmitter<TEffect> extends Notifier<TEffect> {
  EffectEmitter(this._initialEffect);

  final TEffect _initialEffect;

  @override
  TEffect build() => _initialEffect;

  /// Effect を発行する
  // ignore: use_setters_to_change_properties
  void onEffect(TEffect effect) {
    state = effect;
  }

  /// Effect を初期値にリセットする
  void reset() {
    state = _initialEffect;
  }
}
