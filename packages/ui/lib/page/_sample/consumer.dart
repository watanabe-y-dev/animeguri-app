import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/component/async/async_value_builder.dart';
import 'package:ui/page/_sample/page.dart';
import 'package:ui/page/_sample/viewmodel.dart';

@RoutePage()
class SamplePageConsumer extends ConsumerWidget {
  const SamplePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(samplePageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: AsyncValueBuilder(
        data: model,
        builder: (data) => SamplePage(state: data),
      ),
    );
  }
}
