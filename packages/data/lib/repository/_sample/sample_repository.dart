import 'package:domain/exception/repository.dart';
import 'package:domain/repository/_sample/sample_repository.dart';
import 'package:foundation/delay.dart';
import 'package:model/_sample/sample.dart';

class SampleRepositoryImpl implements SampleRepository {
  // サンプルデータ（本来は DB などから取得する）
  final List<Sample> _samples = [
    const Sample(id: '1', name: 'Sample 1', description: 'Description 1'),
    const Sample(id: '2', name: 'Sample 2', description: 'Description 2'),
  ];

  @override
  Future<List<Sample>> fetchList() async {
    try {
      await delaySeconds(1);
      return List.from(_samples);
    } on Exception catch (e) {
      throw RepositoryException.unknown(e.toString());
    }
  }

  @override
  Future<void> add({required Sample sample}) async {
    try {
      await delaySeconds(1);
      _samples.add(sample);
    } on Exception catch (e) {
      throw RepositoryException.unknown(e.toString());
    }
  }
}
