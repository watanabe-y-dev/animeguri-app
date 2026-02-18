part of 'viewmodel.dart';

@freezed
abstract class AnimeDetailPageState with _$AnimeDetailPageState {
  const factory AnimeDetailPageState() = _AnimeDetailPageState;
}

@freezed
sealed class AnimeDetailPageEvent with _$AnimeDetailPageEvent {
  const factory AnimeDetailPageEvent.backButtonTapped() = _BackButtonTapped;
  const factory AnimeDetailPageEvent.officialSiteTapped() =
      _OfficialSiteTapped;
  const factory AnimeDetailPageEvent.xLinkTapped() = _XLinkTapped;
  const factory AnimeDetailPageEvent.photoSectionMoreTapped() =
      _PhotoSectionMoreTapped;
  const factory AnimeDetailPageEvent.descriptionMoreTapped() =
      _DescriptionMoreTapped;
  const factory AnimeDetailPageEvent.streamingPlatformTapped({
    required String platformName,
  }) = _StreamingPlatformTapped;
  const factory AnimeDetailPageEvent.spotTapped({
    required String spotId,
  }) = _SpotTapped;
  const factory AnimeDetailPageEvent.spotSectionMoreTapped() =
      _SpotSectionMoreTapped;
  const factory AnimeDetailPageEvent.reviewSectionMoreTapped() =
      _ReviewSectionMoreTapped;
}

@freezed
sealed class AnimeDetailPageEffect with _$AnimeDetailPageEffect {
  const factory AnimeDetailPageEffect.none() = None;
  const factory AnimeDetailPageEffect.navigateBack() = NavigateBack;
}
