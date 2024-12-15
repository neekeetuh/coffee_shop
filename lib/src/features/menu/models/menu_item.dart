import 'package:coffee_shop/src/features/menu/models/menu_category.dart';

class MenuItem {
  final int id;
  final String title;
  final String image;
  final double price;
  final MenuCategory category;

  MenuItem(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.category});
}
