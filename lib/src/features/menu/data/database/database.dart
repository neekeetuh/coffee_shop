import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';
part 'tables.dart';

@DriftDatabase(tables: [MenuCategories, MenuItems])
class MenuDatabase extends _$MenuDatabase {
  MenuDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'coffee_shop_db');
  }

  Future<List<MenuCategoryDbDto>> fetchCategories() async {
    return select(menuCategories).get();
  }

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

  Future<List<MenuItemDbDto>> fetchMenuItems(
      int categoryId, int page, int pageLimit) async {
    return (select(menuItems)
          ..where((item) => item.categoryId.equals(categoryId))
          ..where((item) => item.page.equals(page))
          ..where((item) => item.pageLimit.equals(pageLimit)))
        .get();
  }

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
