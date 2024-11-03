import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:dio/dio.dart';

abstract interface class IMenuDataSource {
  Future<List<MenuItemDto>> fetchMenuItems(
      {String? categoryId, int page = 0, int limit = 25});
}

final class NetworkMenuDataSource implements IMenuDataSource {
  final Dio dio;

  const NetworkMenuDataSource({required this.dio});
  @override
  Future<List<MenuItemDto>> fetchMenuItems(
      {String? categoryId, int page = 0, int limit = 25}) async {
    final response = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/products/?page=$page&limit=$limit');
    final data = response.data as Map<String, dynamic>;
    final menuItemsDtosListData = data['data'] as List<dynamic>;
    final menuItemsDtosList = menuItemsDtosListData
        .map((json) => MenuItemDto.fromJson(json))
        .toList();
    return menuItemsDtosList;
  }
}
