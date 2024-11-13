import 'package:coffee_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';

abstract interface class ISavableCategoriesDataSource
    implements ICategoriesDataSource {
  Future<void> saveCategories({required List<MenuCategoryDbDto> categories});
}

class DbCategoriesDataSource implements ISavableCategoriesDataSource {
  final IMenuDb _menuDb;

  const DbCategoriesDataSource({required IMenuDb menuDb}) : _menuDb = menuDb;

  @override
  Future<void> saveCategories(
      {required List<MenuCategoryDbDto> categories}) async {
    await _menuDb.insertCategories(categories);
  }

  @override
  Future<List<IMenuCategoryDto>> fetchCategories() async {
    return _menuDb.fetchCategories();
  }
}
