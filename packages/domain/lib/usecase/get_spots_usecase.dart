import 'package:domain/repository/spot_repository.dart';
import 'package:foundation/result.dart';
import 'package:model/spot.dart';

class GetSpotsUseCase {
  GetSpotsUseCase(this.repository);
  final SpotRepository repository;

  Future<Result<List<Spot>, Exception>> call() async {
    return repository.fetchSpots();
  }
}
