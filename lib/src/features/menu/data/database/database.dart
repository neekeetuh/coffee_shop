import 'package:coffee_shop/src/features/menu/models/dto/menu_item_with_category_db_dto.dart';
import 'package:coffee_shop/src/features/menu/models/dto/price_dto.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';
part 'tables.dart';

abstract interface class IMenuDb {
  Future<List<MenuCategoryDataClass>> fetchCategories();
  Future<void> insertCategories(List<MenuCategoryDataClass> categories);
  Future<List<MenuItemWithCategoryData>> fetchMenuItems(
      int categoryId, int page, int pageLimit);
  Future<void> insertMenuItems(List<MenuItemDataClass> items);
}

@DriftDatabase(tables: [MenuCategories, MenuItems])
class MenuDatabase extends _$MenuDatabase implements IMenuDb {
  MenuDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.deleteTable(menuItems.actualTableName);
          await m.createTable(menuItems);
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'coffee_shop_db');
  }

  @override
  Future<List<MenuCategoryDataClass>> fetchCategories() async {
    return select(menuCategories).get();
  }

  @override
  Future<void> insertCategories(List<MenuCategoryDataClass> categories) async {
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
  Future<List<MenuItemWithCategoryData>> fetchMenuItems(
      int categoryId, int page, int pageLimit) async {
    final query = (select(menuItems)
          ..where((item) => item.categoryId.equals(categoryId))
          ..limit(pageLimit, offset: page * pageLimit))
        .join([
      innerJoin(
          menuCategories, menuCategories.id.equalsExp(menuItems.categoryId))
    ]);
    final finalquery = await query
        .map((row) => MenuItemWithCategoryData(
              menuItemData: row.readTable(menuItems),
              menuCategoryData: row.readTable(menuCategories),
            ))
        .get();

    return finalquery;
  }

  @override
  Future<void> insertMenuItems(List<MenuItemDataClass> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          menuItems,
          items.map((item) => MenuItemsCompanion.insert(
                id: Value(item.id),
                title: item.title,
                description: item.description,
                image: item.image,
                price: item.price,
                categoryId: item.categoryId,
              )));
    });
  }
}
