part of 'viewmodel.dart';

enum AnimeListFilter {
  popular,
  newest,
  spotCount,
  alphabetical,
}

@freezed
abstract class AnimeListPageState with _$AnimeListPageState {
  const factory AnimeListPageState({
    @Default(AnimeListFilter.popular) AnimeListFilter selectedFilter,
  }) = _AnimeListPageState;
}

@freezed
sealed class AnimeListPageEvent with _$AnimeListPageEvent {
  const factory AnimeListPageEvent.backButtonTapped() = _BackButtonTapped;
  const factory AnimeListPageEvent.searchBarTapped() = _SearchBarTapped;
  const factory AnimeListPageEvent.filterChipSelected({
    required AnimeListFilter filter,
  }) = _FilterChipSelected;
  const factory AnimeListPageEvent.animeCardTapped({
    required String animeId,
  }) = _AnimeCardTapped;
}

@freezed
sealed class AnimeListPageEffect with _$AnimeListPageEffect {
  const factory AnimeListPageEffect.none() = None;
  const factory AnimeListPageEffect.navigateBack() = NavigateBack;
  const factory AnimeListPageEffect.navigateToSearch() = NavigateToSearch;
  const factory AnimeListPageEffect.navigateToAnimeDetail({
    required String animeId,
  }) = NavigateToAnimeDetail;
}
