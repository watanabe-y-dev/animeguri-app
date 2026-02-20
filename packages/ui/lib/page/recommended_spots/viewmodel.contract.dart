part of 'viewmodel.dart';

@freezed
abstract class RecommendedSpotsPageState with _$RecommendedSpotsPageState {
  const factory RecommendedSpotsPageState({
    required List<SpotItem> spots,
    required List<FilterChipItem> filterChips,
    required int selectedFilterIndex,
    required int totalCount,
    required String sortLabel,
  }) = _RecommendedSpotsPageState;
}

@freezed
abstract class SpotItem with _$SpotItem {
  const factory SpotItem({
    required String id,
    required String spotName,
    required String animeName,
    required String imageUrl,
    SpotBadgeType? badge,
  }) = _SpotItem;
}

@freezed
abstract class FilterChipItem with _$FilterChipItem {
  const factory FilterChipItem({
    required String label,
  }) = _FilterChipItem;
}

@freezed
sealed class RecommendedSpotsPageEvent with _$RecommendedSpotsPageEvent {
  const factory RecommendedSpotsPageEvent.filterChipTapped({
    required int index,
  }) = _RecommendedSpotsPageEventFilterChipTapped;
  const factory RecommendedSpotsPageEvent.sortButtonTapped() =
      _RecommendedSpotsPageEventSortButtonTapped;
  const factory RecommendedSpotsPageEvent.spotTapped({
    required String spotId,
  }) = _RecommendedSpotsPageEventSpotTapped;
  const factory RecommendedSpotsPageEvent.backButtonTapped() =
      _RecommendedSpotsPageEventBackButtonTapped;
}

@freezed
sealed class RecommendedSpotsPageEffect with _$RecommendedSpotsPageEffect {
  const factory RecommendedSpotsPageEffect.none() = None;
  const factory RecommendedSpotsPageEffect.navigateBack() = NavigateBack;
  const factory RecommendedSpotsPageEffect.navigateToSpotDetail({
    required String spotId,
  }) = NavigateToSpotDetail;
}
