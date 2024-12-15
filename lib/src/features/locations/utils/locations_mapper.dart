import 'package:coffee_shop/src/common/data/databases/drift_database/database.dart';
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

extension ModelToDto on LocationModel {
  LocationDto toDto() {
    return LocationDto(address: address, lat: latitude, lng: longitude);
  }
}

extension DtoToDataClassMapper on LocationDto {
  LocationDataClass toDataClass() {
    return LocationDataClass(address: address, latitude: lat, longitude: lng);
  }
}

extension DataClassToDtoMapper on LocationDataClass {
  LocationDto toDto() {
    return LocationDto(address: address, lat: latitude, lng: longitude);
  }
}
