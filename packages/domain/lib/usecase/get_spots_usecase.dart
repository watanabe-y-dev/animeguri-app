import 'package:domain/model/spot/spot.dart';
import 'package:domain/repository/spot_repository.dart';
import 'package:foundation/result.dart';

class GetSpotsUseCase {
  GetSpotsUseCase(this.repository);
  final SpotRepository repository;

  Future<Result<List<Spot>, Exception>> call() async {
    return repository.fetchSpots();
  }
}
