import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/page/_sample/sample_page.dart';
import 'package:ui/page/_sample/sample_page_viewmodel.dart';

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
      body: model.when(
        data: (data) => SamplePage(state: data),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
