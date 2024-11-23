import 'package:coffee_shop/src/features/locations/data/data_sources/locations_data_source.dart';
import 'package:coffee_shop/src/features/locations/models/dto/location_dto.dart';
import 'package:coffee_shop/src/features/locations/models/location_model.dart';
import 'package:coffee_shop/src/features/locations/utils/locations_mapper.dart';

abstract interface class ILocationsRepository {
  Future<List<LocationModel>> loadLocations();
}

final class LocationsRepository implements ILocationsRepository {
  final ILocationsDataSource _networkLocationsDataSource;

  const LocationsRepository(
      {required ILocationsDataSource networkLocationsDataSource})
      : _networkLocationsDataSource = networkLocationsDataSource;
  @override
  Future<List<LocationModel>> loadLocations() async {
    var dtos = <LocationDto>[];
    dtos = await _networkLocationsDataSource.fetchLocations();
    return dtos.map((dto) => dto.toModel()).toList();
  }
}
