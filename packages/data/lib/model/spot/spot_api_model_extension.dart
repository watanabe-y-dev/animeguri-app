import 'package:data/model/spot/spot_api_model.dart';
import 'package:model/spot.dart';

extension SpotApiModelX on SpotApiModel {
  Spot toModel() => Spot(
        id: id,
        name: name,
        description: description,
        location: Location(
          latitude: location.latitude,
          longitude: location.longitude,
        ),
        imageUrls: imageUrls,
        category: category,
        address: address,
        openingHours: openingHours,
        tags: tags,
        animeIds: animeIds,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isPublished: isPublished,
      );
}
