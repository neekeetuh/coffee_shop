import 'dart:io';

import 'package:coffee_shop/src/features/locations/models/dto/location_dto.dart';
import 'package:dio/dio.dart';

abstract interface class ILocationsDataSource {
  Future<List<LocationDto>> fetchLocations({int limit});
}

final class LocationsDataSource implements ILocationsDataSource {
  final Dio dio;

  const LocationsDataSource({required this.dio});

  @override
  Future<List<LocationDto>> fetchLocations({int limit = 25}) async {
    try {
      final response = await dio.get(
          'https://coffeeshop.academy.effective.band/api/v1/locations/?limit=$limit');
      final data = response.data as Map<String, dynamic>;
      final locationsDtosListData = data['data'] as List<dynamic>;
      final locationsDtosList = locationsDtosListData
          .map((json) => LocationDto.fromJson(json))
          .toList();
      return locationsDtosList;
    } on DioException catch (e) {
      throw SocketException('${e.message}');
    }
  }
}
