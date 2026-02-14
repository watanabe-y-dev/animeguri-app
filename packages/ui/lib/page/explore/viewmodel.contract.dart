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
}

@freezed
sealed class ExplorePageEffect with _$ExplorePageEffect {
  const factory ExplorePageEffect.none() = None;
  const factory ExplorePageEffect.navigateToSearch() = NavigateToSearch;
  const factory ExplorePageEffect.navigateToNotifications() =
      NavigateToNotifications;
}
