import 'dart:io';

import 'package:coffee_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/savable_categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
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
    try {
      final dtos = await _networkCategoriesDataSource.fetchCategories()
          as List<MenuCategoryDto>;
      final dbDtos = dtos.map((dto) => dto.toDbDto()).toList();
      _dbCategoriesDataSource.saveCategories(categories: dbDtos);
      return dtos.map((dto) => dto.toModel()).toList();
    } on SocketException {
      final dbDtos = await _dbCategoriesDataSource.fetchCategories()
          as List<MenuCategoryDbDto>;
      return dbDtos.map((dto) => dto.toModel()).toList();
    }
  }
}
