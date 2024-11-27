import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/common/data/databases/drift_database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Provider<MenuDatabase>(
    create: (BuildContext context) => MenuDatabase(),
    child: const CoffeeShopApp(),
    dispose: (context, db) => db.close(),
  ));
}
