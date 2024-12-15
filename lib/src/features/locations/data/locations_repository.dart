import 'dart:io';

import 'package:coffee_shop/src/features/locations/data/data_sources/locations_data_source.dart';
import 'package:coffee_shop/src/features/locations/data/data_sources/savable_locations_data_source.dart';
import 'package:coffee_shop/src/features/locations/models/dto/location_dto.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:coffee_shop/src/features/locations/utils/locations_mapper.dart';

abstract interface class ILocationsRepository {
  Future<List<LocationModel>> loadLocations();
  Future<LocationModel?> fetchSelectedLocation();
  Future<void> setSelectedLocation(LocationModel location);
}

final class LocationsRepository implements ILocationsRepository {
  final ILocationsDataSource _networkLocationsDataSource;
  final ISavableLocationsDataSource _dbLocationsDataSource;

  const LocationsRepository({
    required ILocationsDataSource networkLocationsDataSource,
    required ISavableLocationsDataSource dbLocationsDataSource,
  })  : _dbLocationsDataSource = dbLocationsDataSource,
        _networkLocationsDataSource = networkLocationsDataSource;
  @override
  Future<List<LocationModel>> loadLocations() async {
    var dtos = <LocationDto>[];
    try {
      dtos = await _networkLocationsDataSource.fetchLocations();
      _dbLocationsDataSource.saveLocations(dtos: dtos);
    } on SocketException {
      dtos = await _dbLocationsDataSource.fetchLocations();
    }
    return dtos.map((dto) => dto.toModel()).toList();
  }

  @override
  Future<LocationModel?> fetchSelectedLocation() async {
    return (await _dbLocationsDataSource.fetchSelectedLocation())?.toModel();
  }

  @override
  Future<void> setSelectedLocation(LocationModel location) async {
    await _dbLocationsDataSource.setSelectedLocation(
        location: location.toDto());
  }
}
