part of 'database.dart';

@DataClassName('MenuCategoryDataClass')
class MenuCategories extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('MenuItemDataClass')
class MenuItems extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  TextColumn get price => text().map(PriceDto.converter)();
  IntColumn get categoryId => integer().references(MenuCategories, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
