import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [AsyncValue] をラップして、data/error/loading の UI を切り替えるウィジェット
///
/// デフォルトでは標準的な error と loading の UI を提供し、
/// 必要に応じてカスタマイズ可能。
class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    super.key,
    required this.data,
    required this.builder,
    this.error,
    this.loading,
  });

  /// 表示する [AsyncValue] データ
  final AsyncValue<T> data;

  /// data 状態の時に呼ばれるビルダー
  final Widget Function(T data) builder;

  /// error 状態の時に呼ばれるビルダー（オプショナル）
  ///
  /// 指定しない場合は、デフォルトのエラー表示を使用する
  final Widget Function(Object error, StackTrace stackTrace)? error;

  /// loading 状態の時に呼ばれるビルダー（オプショナル）
  ///
  /// 指定しない場合は、デフォルトのローディング表示を使用する
  final Widget Function()? loading;

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: builder,
      error: error ?? _defaultError,
      loading: loading ?? _defaultLoading,
    );
  }

  Widget _defaultError(Object error, StackTrace stackTrace) {
    return const Center(
      child: Text('エラーが発生しました。'),
    );
  }

  Widget _defaultLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
