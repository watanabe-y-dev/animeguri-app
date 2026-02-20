import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/explore/page.dart';
import 'package:ui/page/explore/viewmodel.dart';
import 'package:ui/router/app_router.dart';

@RoutePage()
class ExplorePageConsumer extends HookConsumerWidget {
  const ExplorePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(explorePageViewModelProvider);
    final notifier = ref.watch(explorePageViewModelProvider.notifier);

    ref.listen(
      explorePageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: ExplorePage(
        state: model,
        onEvent: notifier.onEvent,
      ),
    );
  }
}

void Function(ExplorePageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateToSearch: () {
        // TODO: 検索画面への遷移を実装
      },
      navigateToNotifications: () {
        // TODO: 通知画面への遷移を実装
      },
      navigateToReviews: () {
        unawaited(router()?.push(const ReviewsRoute()));
      },
      navigateToRecommendedSpots: () {
        unawaited(router()?.push(const RecommendedSpotsRoute()));
      },
      navigateToCommunitySpot: () {
        unawaited(router()?.push(const CommunitySpotRoute()));
      },
      navigateToAnimeList: () {
        unawaited(router()?.push(const AnimeListRoute()));
      },
    );
    ref.read(explorePageEffectEmitterProvider.notifier).reset();
  };
}
