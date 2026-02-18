import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/core/widget/async_value_builder.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/recommended_spots/page.dart';
import 'package:ui/page/recommended_spots/viewmodel.dart';

@RoutePage()
class RecommendedSpotsPageConsumer extends HookConsumerWidget {
  const RecommendedSpotsPageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(recommendedSpotsPageViewModelProvider);
    final notifier = ref.watch(recommendedSpotsPageViewModelProvider.notifier);

    ref.listen(
      recommendedSpotsPageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: SafeArea(
        child: AsyncValueBuilder(
          data: model,
          builder: (data) => RecommendedSpotsPage(
            state: data,
            onEvent: notifier.onEvent,
          ),
        ),
      ),
    );
  }
}

void Function(RecommendedSpotsPageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateBack: () {
        unawaited(router()?.maybePop());
      },
      navigateToSpotDetail: (spotId) {
        // TODO: 聖地詳細画面への遷移を実装
      },
    );
    ref.read(recommendedSpotsPageEffectEmitterProvider.notifier).reset();
  };
}
