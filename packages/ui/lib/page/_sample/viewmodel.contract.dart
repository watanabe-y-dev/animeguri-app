part of 'viewmodel.dart';

@freezed
abstract class SamplePageState with _$SamplePageState {
  const factory SamplePageState({
    required List<Sample> samples,
    required SamplePageEffect effect,
  }) = _SamplePageState;
}

@freezed
sealed class SamplePageAction with _$SamplePageAction {
  const factory SamplePageAction.tapAddButton() = _SamplePageActionTapAddButton;
}

@freezed
sealed class SamplePageEffect with _$SamplePageEffect {
  const factory SamplePageEffect.none() = None;
  const factory SamplePageEffect.showSuccessToast({
    required String message,
  }) = ShowSuccessToast;
  const factory SamplePageEffect.showErrorToast({
    required String message,
  }) = ShowErrorToast;
}
