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
}
