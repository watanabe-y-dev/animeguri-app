import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/core/viewmodel/effect_emitter.dart';
import 'package:ui/core/viewmodel/viewmodel_base.dart';

part 'viewmodel.contract.dart';
part 'viewmodel.freezed.dart';
part 'viewmodel.g.dart';

@riverpod
class ReviewsPageViewModel extends _$ReviewsPageViewModel
    implements ViewModelBase<ReviewsPageEvent, ReviewsPageEffect> {
  @override
  ReviewsPageState build() {
    return const ReviewsPageState();
  }

  @override
  void onEvent(ReviewsPageEvent event) {
    event.when(
      backButtonTapped: () =>
          effect(const ReviewsPageEffect.navigateBack()),
      sortChipTapped: () {
        // TODO: ソート切り替え
      },
      filterChipTapped: (filter) {
        // TODO: フィルター切り替え
      },
      reviewTapped: (reviewId) {
        // TODO: レビュー詳細への遷移
      },
    );
  }

  @override
  void effect(ReviewsPageEffect effect) {
    ref.read(reviewsPageEffectEmitterProvider.notifier).onEffect(effect);
  }
}

final reviewsPageEffectEmitterProvider =
    NotifierProvider<EffectEmitter<ReviewsPageEffect>, ReviewsPageEffect>(
  () => EffectEmitter(const ReviewsPageEffect.none()),
);
