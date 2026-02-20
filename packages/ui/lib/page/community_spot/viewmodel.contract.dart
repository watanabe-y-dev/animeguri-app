part of 'viewmodel.dart';

/// みんなの巡礼一覧のフィルターカテゴリ
enum CommunitySpotFilter {
  all('すべて'),
  newest('新着'),
  trending('話題'),
  popular('人気'),
  kanto('関東');

  const CommunitySpotFilter(this.label);

  final String label;
}

/// みんなの巡礼投稿データ
@freezed
abstract class CommunitySpotPost with _$CommunitySpotPost {
  const factory CommunitySpotPost({
    required String id,
    required String username,
    required String spotName,
    required String animeName,
    required double imageHeight,
  }) = _CommunitySpotPost;
}

@freezed
abstract class CommunitySpotPageState
    with _$CommunitySpotPageState {
  const factory CommunitySpotPageState({
    required List<CommunitySpotPost> posts,
    required CommunitySpotFilter selectedFilter,
  }) = _CommunitySpotPageState;
}

@freezed
sealed class CommunitySpotPageEvent
    with _$CommunitySpotPageEvent {
  const factory CommunitySpotPageEvent.backButtonTapped() =
      _CommunitySpotPageEventBackButtonTapped;
  const factory CommunitySpotPageEvent.filterSelected(
    CommunitySpotFilter filter,
  ) = _CommunitySpotPageEventFilterSelected;
  const factory CommunitySpotPageEvent.postTapped(String postId) =
      _CommunitySpotPageEventPostTapped;
}

@freezed
sealed class CommunitySpotPageEffect
    with _$CommunitySpotPageEffect {
  const factory CommunitySpotPageEffect.none() = None;
  const factory CommunitySpotPageEffect.navigateBack() = NavigateBack;
}
