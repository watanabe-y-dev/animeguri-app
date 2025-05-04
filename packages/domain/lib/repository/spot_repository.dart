import 'package:foundation/result.dart';
import 'package:model/spot.dart';

abstract interface class SpotRepository {
  Future<Result<List<Spot>, Exception>> fetchSpots();
}
