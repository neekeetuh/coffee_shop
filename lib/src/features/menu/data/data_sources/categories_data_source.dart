import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:dio/dio.dart';

abstract interface class ICategoriesDataSource {
  Future<List<IMenuCategoryDto>> fetchCategories();
}

final class NetworkCategoriesDataSource implements ICategoriesDataSource {
  final Dio dio;

  const NetworkCategoriesDataSource({required this.dio});
  @override
  Future<List<MenuCategoryDto>> fetchCategories(
      {int page = 0, int limit = 25}) async {
    final response = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/products/categories?page=$page&limit=$limit');
    final data = response.data as Map<String, dynamic>;
    final categoriesDtosListData = data['data'] as List<dynamic>;
    final categoriesDtosList = categoriesDtosListData
        .map((json) => MenuCategoryDto.fromJson(json))
        .toList();
    return categoriesDtosList;
  }
}
