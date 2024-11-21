import 'package:coffee_shop/src/features/menu/data/database/database.dart';

class MenuItemWithCategoryData {
  final MenuItemDataClass menuItemData;
  final MenuCategoryDataClass menuCategoryData;

  const MenuItemWithCategoryData({
    required this.menuItemData,
    required this.menuCategoryData,
  });
}
