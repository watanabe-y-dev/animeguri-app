import 'package:model/_sample/sample.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_repository.g.dart';

@riverpod
SampleRepository sampleRepository(Ref ref) => throw UnimplementedError();

abstract interface class SampleRepository {
  Future<List<Sample>> fetchList();
  Future<void> add({required Sample sample});
}
