import 'package:meta/meta.dart';

/// ViewModel の基底インターフェース
///
/// すべての ViewModel はこのインターフェースを実装する必要がある。
///
/// - [onEvent]: UI からのイベントを受け取る公開メソッド
/// - [effect]: Effect を発行する protected メソッド（サブクラス内でのみ使用）
abstract interface class ViewModelBase<TEvent, TEffect> {
  /// UI からのイベントを処理する
  ///
  /// UI 層から呼び出される公開メソッド。
  void onEvent(TEvent event);

  /// Effect を発行する
  ///
  /// サブクラス内でのみ使用されるべきメソッド。
  /// 外部から直接呼び出すべきではない。
  @protected
  void effect(TEffect effect);
}
