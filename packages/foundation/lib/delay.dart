/// 遅延処理用のユーティリティ関数
library;

/// 指定した [duration] だけ処理を遅延させる
///
/// 例:
/// ```dart
/// await delay(const Duration(seconds: 1));
/// ```
Future<void> delay(Duration duration) => Future<void>.delayed(duration);

/// 指定した秒数だけ処理を遅延させる
///
/// 例:
/// ```dart
/// await delaySeconds(1);
/// ```
Future<void> delaySeconds(int seconds) =>
    Future<void>.delayed(Duration(seconds: seconds));

/// 指定したミリ秒数だけ処理を遅延させる
///
/// 例:
/// ```dart
/// await delayMilliseconds(500);
/// ```
Future<void> delayMilliseconds(int milliseconds) =>
    Future<void>.delayed(Duration(milliseconds: milliseconds));
