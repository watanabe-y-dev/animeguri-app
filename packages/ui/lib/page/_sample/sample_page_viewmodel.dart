import 'package:domain/notifier/_sample/sample_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/_sample/sample.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_page_viewmodel.freezed.dart';
part 'sample_page_viewmodel.g.dart';

@freezed
abstract class SamplePageState with _$SamplePageState {
  const factory SamplePageState({
    required List<Sample> samples,
  }) = _SamplePageState;
}

@riverpod
class SamplePageViewModel extends _$SamplePageViewModel {
  @override
  Future<SamplePageState> build() async {
    final samples = await ref.watch(sampleProvider.future);
    return SamplePageState(samples: samples);
  }

  void tapAddButton() {}
}
