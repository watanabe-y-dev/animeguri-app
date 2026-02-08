import 'package:domain/repository/_sample/sample_repository.dart';
import 'package:foundation/delay.dart';
import 'package:model/_sample/sample.dart';

class SampleRepositoryImpl implements SampleRepository {
  @override
  Future<List<Sample>> fetchSamples() async {
    await delaySeconds(1);
    return [
      const Sample(id: '1', name: 'Sample 1', description: 'Sample 1'),
      const Sample(id: '2', name: 'Sample 2', description: 'Sample 2'),
    ];
  }
}
