part of 'viewmodel.dart';

@freezed
abstract class SpotDetailPageState with _$SpotDetailPageState {
  const factory SpotDetailPageState() = _SpotDetailPageState;
}

@freezed
sealed class SpotDetailPageEvent with _$SpotDetailPageEvent {
  const factory SpotDetailPageEvent.backButtonTapped() = _BackButtonTapped;
  const factory SpotDetailPageEvent.shareButtonTapped() = _ShareButtonTapped;
  const factory SpotDetailPageEvent.bookmarkButtonTapped() =
      _BookmarkButtonTapped;
  const factory SpotDetailPageEvent.checkinButtonTapped() =
      _CheckinButtonTapped;
  const factory SpotDetailPageEvent.routeButtonTapped() = _RouteButtonTapped;
  const factory SpotDetailPageEvent.animeReferenceTapped() =
      _AnimeReferenceTapped;
  const factory SpotDetailPageEvent.openMapTapped() = _OpenMapTapped;
  const factory SpotDetailPageEvent.reviewSeeAllTapped() =
      _ReviewSeeAllTapped;
  const factory SpotDetailPageEvent.nearbySpotTapped({
    required int index,
  }) = _NearbySpotTapped;
}

@freezed
sealed class SpotDetailPageEffect with _$SpotDetailPageEffect {
  const factory SpotDetailPageEffect.none() = None;
  const factory SpotDetailPageEffect.navigateBack() = NavigateBack;
  const factory SpotDetailPageEffect.shareSpot() = ShareSpot;
  const factory SpotDetailPageEffect.openRouteNavigation() =
      OpenRouteNavigation;
  const factory SpotDetailPageEffect.navigateToAnimeDetail() =
      NavigateToAnimeDetail;
  const factory SpotDetailPageEffect.openMapApp() = OpenMapApp;
  const factory SpotDetailPageEffect.navigateToReviews() = NavigateToReviews;
}
