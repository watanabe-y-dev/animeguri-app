import 'package:domain/repository/_sample/sample_repository.dart';
import 'package:model/_sample/sample.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_notifier.g.dart';

@riverpod
class SampleNotifier extends _$SampleNotifier {
  @override
  Future<List<Sample>> build() async {
    final repository = ref.watch(sampleRepositoryProvider);
    return repository.fetchSamples();
  }
}
