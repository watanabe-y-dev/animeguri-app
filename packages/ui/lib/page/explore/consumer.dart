import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/page/explore/page.dart';
import 'package:ui/page/explore/viewmodel.dart';

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
  return useCallback(
    (effect) {
      effect.when(
        none: () => null,
        navigateToSearch: () {
          // TODO: 検索画面への遷移を実装
        },
        navigateToNotifications: () {
          // TODO: 通知画面への遷移を実装
        },
      );
      ref.read(explorePageEffectEmitterProvider.notifier).reset();
    },
    [],
  );
}
