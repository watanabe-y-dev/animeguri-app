import 'package:domain/model/spot/spot.dart';
import 'package:foundation/result.dart';

abstract interface class SpotRepository {
  Future<Result<List<Spot>, Exception>> fetchSpots();
}
