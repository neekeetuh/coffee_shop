import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:coffee_shop/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuScreen(
        categories: categoriesMock,
      ),
      theme: mainTheme,
    );
  }
}

//mocks
final List<MenuCategory> categoriesMock = <MenuCategory>[
  MenuCategory(title: 'Черный кофе'),
  MenuCategory(title: 'Кофе с молоком'),
  MenuCategory(title: 'Чай'),
  MenuCategory(title: 'Арабика'),
  MenuCategory(title: 'Робуста'),
  MenuCategory(title: 'Либерика'),
];

final itemsMock = <MenuItem>[
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffeeTemplate,
      price: 50,
      category: categoriesMock[0]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffeeTemplate,
      price: 30,
      category: categoriesMock[0]),
  MenuItem(title: 'Латте', price: 50, category: categoriesMock[0]),
  MenuItem(title: 'Американо', price: 50, category: categoriesMock[0]),
  MenuItem(title: 'Мокка', price: 30, category: categoriesMock[0]),
  MenuItem(title: 'Эспрессо', price: 50, category: categoriesMock[0]),
  MenuItem(title: 'Капучино', price: 50, category: categoriesMock[1]),
  MenuItem(title: 'Мокачино', price: 30, category: categoriesMock[1]),
  MenuItem(title: 'Латте', price: 50, category: categoriesMock[1]),
  MenuItem(title: 'Капучино', price: 50, category: categoriesMock[2]),
  MenuItem(title: 'Мокачино', price: 30, category: categoriesMock[2]),
  MenuItem(title: 'Латте', price: 50, category: categoriesMock[2]),
  MenuItem(title: 'Мокачино', price: 30, category: categoriesMock[3]),
  MenuItem(title: 'Латте', price: 50, category: categoriesMock[3]),
  MenuItem(title: 'Капучино', price: 50, category: categoriesMock[4]),
  MenuItem(title: 'Мокачино', price: 30, category: categoriesMock[4]),
  MenuItem(title: 'Латте', price: 50, category: categoriesMock[5]),
  MenuItem(title: 'Латте', price: 50, category: categoriesMock[5]),
];
