import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final menuDb = MenuDatabase();
  runApp(const CoffeeShopApp());
}
