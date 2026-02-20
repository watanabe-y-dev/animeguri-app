import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/anime_detail/page.dart';
import 'package:ui/page/anime_detail/viewmodel.dart';

@RoutePage()
class AnimeDetailPageConsumer extends HookConsumerWidget {
  const AnimeDetailPageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(animeDetailPageViewModelProvider);
    final notifier = ref.watch(animeDetailPageViewModelProvider.notifier);

    ref.listen(
      animeDetailPageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: SafeArea(
        child: AnimeDetailPage(
          state: model,
          onEvent: notifier.onEvent,
        ),
      ),
    );
  }
}

void Function(AnimeDetailPageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateBack: () {
        unawaited(router()?.maybePop());
      },
    );
    ref.read(animeDetailPageEffectEmitterProvider.notifier).reset();
  };
}
