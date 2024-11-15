import 'package:coffee_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:coffee_shop/src/features/menu/utils/category_mapper.dart';

abstract interface class ISavableCategoriesDataSource
    implements ICategoriesDataSource {
  Future<void> saveCategories({required List<MenuCategoryDto> categories});
}

class DbCategoriesDataSource implements ISavableCategoriesDataSource {
  final IMenuDb _menuDb;

  const DbCategoriesDataSource({required IMenuDb menuDb}) : _menuDb = menuDb;

  @override
  Future<void> saveCategories(
      {required List<MenuCategoryDto> categories}) async {
    await _menuDb.insertCategories(
        categories.map((category) => category.toDataClass()).toList());
  }

  @override
  Future<List<MenuCategoryDto>> fetchCategories() async {
    final categories = await _menuDb.fetchCategories();
    return categories.map((category) => category.toDto()).toList();
  }
}
