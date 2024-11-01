import 'package:coffee_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffee_shop/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MenuScreen(),
      theme: mainTheme,
    );
  }
}
