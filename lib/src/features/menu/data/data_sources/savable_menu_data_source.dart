import 'package:coffee_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_with_category_db_dto.dart';

abstract interface class ISavableMenuDataSource implements IMenuDataSource {
  Future<void> saveMenuItems({required List<MenuItemDbDto> items});
}

class DbMenuDataSource implements ISavableMenuDataSource {
  final IMenuDb _menuDb;

  const DbMenuDataSource({required IMenuDb menuDb}) : _menuDb = menuDb;
  @override
  Future<List<MenuItemWithCategoryDbDto>> fetchMenuItems(
      {String categoryId = '0', int page = 0, int limit = 25}) async {
    return _menuDb.fetchMenuItems(int.parse(categoryId), page, limit);
  }

  @override
  Future<void> saveMenuItems({required List<MenuItemDbDto> items}) async {
    await _menuDb.insertMenuItems(items);
  }
}
