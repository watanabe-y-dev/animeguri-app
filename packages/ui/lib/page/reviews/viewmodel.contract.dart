part of 'viewmodel.dart';

@freezed
abstract class ReviewsPageState with _$ReviewsPageState {
  const factory ReviewsPageState() = _ReviewsPageState;
}

@freezed
sealed class ReviewsPageEvent with _$ReviewsPageEvent {
  const factory ReviewsPageEvent.backButtonTapped() = _BackButtonTapped;
  const factory ReviewsPageEvent.sortChipTapped() = _SortChipTapped;
  const factory ReviewsPageEvent.filterChipTapped({
    required String filter,
  }) = _FilterChipTapped;
  const factory ReviewsPageEvent.reviewTapped({
    required String reviewId,
  }) = _ReviewTapped;
}

@freezed
sealed class ReviewsPageEffect with _$ReviewsPageEffect {
  const factory ReviewsPageEffect.none() = None;
  const factory ReviewsPageEffect.navigateBack() = NavigateBack;
}
