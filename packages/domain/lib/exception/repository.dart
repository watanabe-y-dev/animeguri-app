import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository.freezed.dart';

/// Repository 層で発生する例外
@freezed
sealed class RepositoryException
    with _$RepositoryException
    implements Exception {
  /// 不明なエラー
  const factory RepositoryException.unknown([
    @Default('不明なエラーが発生しました') String message,
  ]) = UnknownException;

  /// ネットワークエラー
  const factory RepositoryException.network([
    @Default('ネットワークエラーが発生しました') String message,
  ]) = NetworkException;

  /// データが見つからない
  const factory RepositoryException.dataNotFound([
    @Default('データが見つかりません') String message,
  ]) = DataNotFoundException;
}
