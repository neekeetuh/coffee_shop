import 'dart:io';

import 'package:coffee_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/savable_categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/utils/category_mapper.dart';

abstract interface class ICategoryRepository {
  Future<List<MenuCategory>> loadCategories();
}

final class CategoryRepository implements ICategoryRepository {
  final ICategoriesDataSource _networkCategoriesDataSource;
  final ISavableCategoriesDataSource _dbCategoriesDataSource;
  const CategoryRepository(
      {required ISavableCategoriesDataSource dbCategoriesDataSource,
      required ICategoriesDataSource networkCategoriesDataSource})
      : _dbCategoriesDataSource = dbCategoriesDataSource,
        _networkCategoriesDataSource = networkCategoriesDataSource;
  @override
  Future<List<MenuCategory>> loadCategories() async {
    var dtos = <MenuCategoryDto>[];
    try {
      dtos = await _networkCategoriesDataSource.fetchCategories();
      _dbCategoriesDataSource.saveCategories(categories: dtos);
    } on SocketException {
      dtos = await _dbCategoriesDataSource.fetchCategories();
    }
    return dtos.map((dto) => dto.toModel()).toList();
  }
}
