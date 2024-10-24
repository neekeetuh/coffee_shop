import 'package:coffee_shop/src/features/menu/models/menu_category.dart';

class MenuItem {
  final String title;
  final String image;
  final int price;
  final MenuCategory category;

  MenuItem({required this.title, required this.image, required this.price, required this.category});
}