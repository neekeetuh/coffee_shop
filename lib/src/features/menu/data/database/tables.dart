part of 'database.dart';

class MenuCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()();
  TextColumn get title => text()();
}

class MenuItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer()();
  TextColumn get title => text()();
  TextColumn get image => text()();
  RealColumn get price => real()();
  IntColumn get category => integer().references(MenuCategories, #id)();
  IntColumn get page => integer()();
  IntColumn get pageLimit => integer()();
}
