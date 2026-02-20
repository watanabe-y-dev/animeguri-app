import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/reviews/page.dart';
import 'package:ui/page/reviews/viewmodel.dart';

@RoutePage()
class ReviewsPageConsumer extends HookConsumerWidget {
  const ReviewsPageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(reviewsPageViewModelProvider);
    final notifier = ref.watch(reviewsPageViewModelProvider.notifier);

    ref.listen(
      reviewsPageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: SafeArea(
        child: ReviewsPage(
          state: model,
          onEvent: notifier.onEvent,
        ),
      ),
    );
  }
}

void Function(ReviewsPageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateBack: () {
        unawaited(router()?.maybePop());
      },
    );
    ref.read(reviewsPageEffectEmitterProvider.notifier).reset();
  };
}
