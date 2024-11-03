import 'dart:io';

import 'package:coffee_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/utils/category_mapper.dart';

abstract interface class ICategoryRepository {
  Future<List<MenuCategory>> loadCategories();
}

final class CategoryRepository implements ICategoryRepository {
  final ICategoriesDataSource _networkCategoriesDataSource;
  const CategoryRepository(
      {required ICategoriesDataSource networkCategoriesDataSource})
      : _networkCategoriesDataSource = networkCategoriesDataSource;
  @override
  Future<List<MenuCategory>> loadCategories() async {
    var dtos = <MenuCategoryDto>[];
    try {
      dtos = await _networkCategoriesDataSource.fetchCategories();
    } on SocketException {
      //TODO: implement getting cached categories from db
    }
    return dtos.map((dto) => dto.toModel()).toList();
  }
}
