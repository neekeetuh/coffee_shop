import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/features/menu/providers/chosen_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ChosenCategoryProvider(),
    )
  ], child: const CoffeeShopApp()));
}
