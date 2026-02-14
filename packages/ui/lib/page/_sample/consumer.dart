import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/core/widget/async_value_builder.dart';
import 'package:ui/hook/snackbar.dart';
import 'package:ui/page/_sample/page.dart';
import 'package:ui/page/_sample/viewmodel.dart';

@RoutePage()
class SamplePageConsumer extends HookConsumerWidget {
  const SamplePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleEffect = _useHandleEffect(ref);
    final model = ref.watch(samplePageViewModelProvider);
    final notifier = ref.watch(samplePageViewModelProvider.notifier);

    ref.listen(
      samplePageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: AsyncValueBuilder(
        data: model,
        builder: (data) => SamplePage(
          state: data,
          onEvent: notifier.onEvent,
        ),
      ),
    );
  }
}

void Function(SamplePageEffect) _useHandleEffect(WidgetRef ref) {
  final showSnackbar = useSnackbar();
  return useCallback(
    (effect) {
      effect.when(
        none: () => null,
        showSuccessToast: (message) =>
            showSnackbar(message, type: SnackbarType.success),
        showErrorToast: (message) =>
            showSnackbar(message, type: SnackbarType.error),
      );
      ref.read(samplePageEffectEmitterProvider.notifier).reset();
    },
    [],
  );
}
