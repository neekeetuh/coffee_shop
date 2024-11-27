import 'dart:convert';

import 'package:coffee_shop/src/common/data/databases/drift_database/database.dart';
import 'package:coffee_shop/src/common/data/databases/shared_preferences/shared_preferences_keys.dart';
import 'package:coffee_shop/src/features/locations/data/data_sources/locations_data_source.dart';
import 'package:coffee_shop/src/features/locations/models/dto/location_dto.dart';
import 'package:coffee_shop/src/features/locations/utils/locations_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ISavableLocationsDataSource
    implements ILocationsDataSource {
  Future<void> saveLocations({required List<LocationDto> dtos});
  Future<LocationDto?> fetchSelectedLocation();
  Future<void> setSelectedLocation({required LocationDto location});
}

class DbLocationsDataSource implements ISavableLocationsDataSource {
  final IMenuDb _menuDb;

  DbLocationsDataSource({required IMenuDb menuDb}) : _menuDb = menuDb;
  @override
  Future<List<LocationDto>> fetchLocations({int limit = 25}) async {
    return (await _menuDb.fetchLocations())
        .map((location) => location.toDto())
        .toList();
  }

  @override
  Future<void> saveLocations({required List<LocationDto> dtos}) async {
    _menuDb.insertLocations(dtos.map((dto) => dto.toDataClass()).toList());
  }

  @override
  Future<LocationDto?> fetchSelectedLocation() async {
    final locationString = (await SharedPreferences.getInstance())
        .getString(SharedPreferencesKeys.selectedLocation);
    if (locationString == null) {
      return null;
    }
    final location = LocationDto.fromJson(
        jsonDecode(locationString) as Map<String, dynamic>);
    return location;
  }

  @override
  Future<void> setSelectedLocation({required LocationDto location}) async {
    (await SharedPreferences.getInstance()).setString(
        SharedPreferencesKeys.selectedLocation, jsonEncode(location.toJson()));
  }
}
