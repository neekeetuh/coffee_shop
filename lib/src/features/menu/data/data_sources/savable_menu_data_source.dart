import 'package:coffee_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:coffee_shop/src/features/menu/utils/menu_items_mapper.dart';

abstract interface class ISavableMenuDataSource implements IMenuDataSource {
  Future<void> saveMenuItems({required List<MenuItemDto> items});
}

class DbMenuDataSource implements ISavableMenuDataSource {
  final IMenuDb _menuDb;

  const DbMenuDataSource({required IMenuDb menuDb}) : _menuDb = menuDb;
  @override
  Future<List<MenuItemDto>> fetchMenuItems(
      {String categoryId = '0', int page = 0, int limit = 25}) async {
    final items =
        await _menuDb.fetchMenuItems(int.parse(categoryId), page, limit);

    return items.map((item) => item.toDto()).toList();
  }

  @override
  Future<void> saveMenuItems({required List<MenuItemDto> items}) async {
    await _menuDb
        .insertMenuItems(items.map((item) => item.toDataClass()).toList());
  }
}
