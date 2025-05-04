import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_api_model.freezed.dart';
part 'spot_api_model.g.dart';

@freezed
abstract class SpotApiModel with _$SpotApiModel {
  const factory SpotApiModel({
    required String id,
    required String name,
    required String description,
    required LocationApiModel location,
    required List<String> imageUrls,
    required String category,
    required String address,
    required Map<String, String> openingHours,
    required List<String> tags,
    required List<String> animeIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isPublished,
  }) = _SpotApiModel;

  factory SpotApiModel.fromJson(Map<String, Object?> json) =>
      _$SpotApiModelFromJson(json);
}

@freezed
abstract class LocationApiModel with _$LocationApiModel {
  const factory LocationApiModel({
    required double latitude,
    required double longitude,
  }) = _LocationApiModel;

  factory LocationApiModel.fromJson(Map<String, Object?> json) =>
      _$LocationApiModelFromJson(json);
}
