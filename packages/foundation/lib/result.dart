import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T data) = Success<T, E>;
  const factory Result.failure(E error) = Failure<T, E>;

  R? onSuccess<R>(R Function(T data) action) {
    if (this is Success<T, E>) {
      return action((this as Success<T, E>).data);
    }
    return null;
  }

  R? onFailure<R>(R Function(E error) action) {
    if (this is Failure<T, E>) {
      return action((this as Failure<T, E>).error);
    }
    return null;
  }
}
