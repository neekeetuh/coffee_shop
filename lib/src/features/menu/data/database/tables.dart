part of 'database.dart';

@DataClassName('MenuCategoryDbDto', implementing: [IMenuCategoryDto])
class MenuCategories extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('MenuItemDbDto', implementing: [IMenuItemDto])
class MenuItems extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get image => text()();
  RealColumn get price => real()();
  IntColumn get categoryId => integer().references(MenuCategories, #id)();
  IntColumn get page => integer()();
  IntColumn get pageLimit => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id, page, pageLimit};
}
