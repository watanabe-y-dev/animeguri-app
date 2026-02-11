/// Effect を発行する Emitter の基底インターフェース
///
/// すべての Effect Emitter はこのインターフェースを実装する必要がある。
///
/// - [onEffect]: Effect を発行する
/// - [reset]: Effect をリセットする
abstract interface class EffectEmitterBase<TEffect> {
  /// Effect を発行する
  void onEffect(TEffect effect);

  /// Effect をリセットする
  void reset();
}
