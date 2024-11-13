import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';
part 'tables.dart';

abstract interface class IMenuDb {
  Future<List<MenuCategoryDbDto>> fetchCategories();
  Future<void> insertCategories(List<MenuCategoryDbDto> categories);
  Future<List<MenuItemDbDto>> fetchMenuItems(
      int categoryId, int page, int pageLimit);
  Future<void> insertMenuItems(List<MenuItemDbDto> items);
}

@DriftDatabase(tables: [MenuCategories, MenuItems])
class MenuDatabase extends _$MenuDatabase implements IMenuDb {
  MenuDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'coffee_shop_db');
  }

  @override
  Future<List<MenuCategoryDbDto>> fetchCategories() async {
    return select(menuCategories).get();
  }

  @override
  Future<void> insertCategories(List<MenuCategoryDbDto> categories) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          menuCategories,
          categories.map((category) => MenuCategoriesCompanion.insert(
                title: category.title,
                id: Value(category.id),
              )));
    });
  }

  @override
  Future<List<MenuItemDbDto>> fetchMenuItems(
      int categoryId, int page, int pageLimit) async {
    return (select(menuItems)
          ..where((item) => item.categoryId.equals(categoryId))
          ..where((item) => item.page.equals(page))
          ..where((item) => item.pageLimit.equals(pageLimit)))
        .get();
  }

  @override
  Future<void> insertMenuItems(List<MenuItemDbDto> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          menuItems,
          items.map((item) => MenuItemsCompanion.insert(
                id: item.id,
                title: item.title,
                image: item.image,
                price: item.price,
                categoryId: item.categoryId,
                page: item.page,
                pageLimit: item.pageLimit,
              )));
    });
  }
}
