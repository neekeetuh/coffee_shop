import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';

class MenuItem {
  final String title;
  final String image;
  final int price;
  final MenuCategory category;

  MenuItem(
      {required this.title,
      this.image = ImageSources.coffeeDefault,
      required this.price,
      required this.category});
}
