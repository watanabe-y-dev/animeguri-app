import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/anime_list/page.dart';
import 'package:ui/page/anime_list/viewmodel.dart';

@RoutePage()
class AnimeListPageConsumer extends HookConsumerWidget {
  const AnimeListPageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final state = ref.watch(animeListPageViewModelProvider);
    final notifier = ref.watch(animeListPageViewModelProvider.notifier);

    ref.listen(
      animeListPageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: SafeArea(
        child: AnimeListPage(
          state: state,
          onEvent: notifier.onEvent,
        ),
      ),
    );
  }
}

void Function(AnimeListPageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateBack: () {
        unawaited(router()?.maybePop());
      },
      navigateToSearch: () {
        // TODO: 検索画面への遷移を実装
      },
      navigateToAnimeDetail: (animeId) {
        // TODO: 作品詳細画面への遷移を実装
      },
    );
    ref.read(animeListPageEffectEmitterProvider.notifier).reset();
  };
}
