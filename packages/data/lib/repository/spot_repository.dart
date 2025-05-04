import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/spot/spot_api_model.dart';
import 'package:data/model/spot/spot_api_model_extension.dart';
import 'package:domain/repository/spot_repository.dart';
import 'package:foundation/result.dart';
import 'package:model/spot.dart';

class SpotRepositoryImpl implements SpotRepository {
  SpotRepositoryImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseFirestore firestore;

  @override
  Future<Result<List<Spot>, Exception>> fetchSpots() async {
    try {
      final snapshot = await firestore.collection('spots').get();
      return Result.success(
        snapshot.docs
            .map((doc) => SpotApiModel.fromJson(doc.data()..['id'] = doc.id))
            .map((spot) => spot.toModel())
            .toList(),
      );
    } on Exception catch (e) {
      // TODO: エラーハンドリング
      return Result.failure(e);
    }
  }
}
