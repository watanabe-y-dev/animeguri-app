part of 'viewmodel.dart';

@freezed
abstract class ExplorePageState with _$ExplorePageState {
  const factory ExplorePageState() = _ExplorePageState;
}

@freezed
sealed class ExplorePageEvent with _$ExplorePageEvent {
  const factory ExplorePageEvent.searchBarTapped() = _SearchBarTapped;
  const factory ExplorePageEvent.notificationButtonTapped() =
      _NotificationButtonTapped;
  const factory ExplorePageEvent.reviewsSectionActionTapped() =
      _ReviewsSectionActionTapped;
  const factory ExplorePageEvent.recommendedSpotsSectionActionTapped() =
      _RecommendedSpotsSectionActionTapped;
  const factory ExplorePageEvent.communitySpotSectionActionTapped() =
      _CommunitySpotSectionActionTapped;
  const factory ExplorePageEvent.animeListSectionActionTapped() =
      _AnimeListSectionActionTapped;
}

@freezed
sealed class ExplorePageEffect with _$ExplorePageEffect {
  const factory ExplorePageEffect.none() = None;
  const factory ExplorePageEffect.navigateToSearch() = NavigateToSearch;
  const factory ExplorePageEffect.navigateToNotifications() =
      NavigateToNotifications;
  const factory ExplorePageEffect.navigateToReviews() = NavigateToReviews;
  const factory ExplorePageEffect.navigateToRecommendedSpots() =
      NavigateToRecommendedSpots;
  const factory ExplorePageEffect.navigateToCommunitySpot() =
      NavigateToCommunitySpot;
  const factory ExplorePageEffect.navigateToAnimeList() = NavigateToAnimeList;
}
