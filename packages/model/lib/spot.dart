import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot.freezed.dart';

@freezed
abstract class Spot with _$Spot {
  const factory Spot({
    required String id,
    required String name,
    required String description,
    required Location location,
    required List<String> imageUrls,
    required String category,
    required String address,
    required Map<String, String> openingHours,
    required List<String> tags,
    required List<String> animeIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isPublished,
  }) = _Spot;
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
  }) = _Location;
}
