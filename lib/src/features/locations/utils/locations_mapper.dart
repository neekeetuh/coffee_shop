import 'package:coffee_shop/src/features/locations/models/dto/location_dto.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';

extension LocationsMapper on LocationDto {
  LocationModel toModel() {
    return LocationModel(
      address: address,
      latitude: lat,
      longitude: lng,
    );
  }
}
