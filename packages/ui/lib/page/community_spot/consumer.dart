import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/core/widget/async_value_builder.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/page/community_spot/page.dart';
import 'package:ui/page/community_spot/viewmodel.dart';

@RoutePage()
class CommunitySpotPageConsumer extends HookConsumerWidget {
  const CommunitySpotPageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(communitySpotPageViewModelProvider);
    final notifier =
        ref.watch(communitySpotPageViewModelProvider.notifier);

    ref.listen(
      communitySpotPageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      body: SafeArea(
        child: AsyncValueBuilder(
          data: model,
          builder: (data) => CommunitySpotPage(
            state: data,
            onEvent: notifier.onEvent,
          ),
        ),
      ),
    );
  }
}

void Function(CommunitySpotPageEffect) _useHandleEffect(WidgetRef ref) {
  final router = useRouter();
  return (effect) {
    effect.when(
      none: () => null,
      navigateBack: () {
        unawaited(router()?.maybePop());
      },
    );
    ref.read(communitySpotPageEffectEmitterProvider.notifier).reset();
  };
}
