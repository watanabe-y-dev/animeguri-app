part of 'viewmodel.dart';

@freezed
abstract class SamplePageState with _$SamplePageState {
  const factory SamplePageState({
    required List<Sample> samples,
    required SamplePageEffect effect,
  }) = _SamplePageState;
}

@freezed
sealed class SamplePageEvent with _$SamplePageEvent {
  const factory SamplePageEvent.addButtonTapped() =
      _SamplePageEventAddButtonTapped;
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
