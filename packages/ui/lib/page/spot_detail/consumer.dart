import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/spot_detail/page.dart';
import 'package:ui/page/spot_detail/viewmodel.dart';

@RoutePage()
class SpotDetailPageConsumer extends HookConsumerWidget {
  const SpotDetailPageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(spotDetailPageViewModelProvider);
    final notifier = ref.watch(spotDetailPageViewModelProvider.notifier);

    ref.listen(
      spotDetailPageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: SafeArea(
        child: SpotDetailPage(
          state: model,
          onEvent: notifier.onEvent,
        ),
      ),
    );
  }
}

void Function(SpotDetailPageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateBack: () {
        unawaited(router()?.maybePop());
      },
      shareSpot: () {
        // TODO: シェア機能を実装
      },
      openRouteNavigation: () {
        // TODO: ルート案内を実装
      },
      navigateToAnimeDetail: () {
        // TODO: 作品詳細画面への遷移を実装
      },
      openMapApp: () {
        // TODO: 地図アプリを開く処理を実装
      },
      navigateToReviews: () {
        // TODO: レビュー一覧画面への遷移を実装
      },
    );
    ref.read(spotDetailPageEffectEmitterProvider.notifier).reset();
  };
}
