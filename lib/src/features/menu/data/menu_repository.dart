import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';

abstract interface class IMenuRepository {
  List<MenuItem> loadMenuItems(MenuCategory category);
}

final class MenuRepository implements IMenuRepository {
  const MenuRepository();
  @override
  List<MenuItem> loadMenuItems(MenuCategory category) {
    // TODO: implement method
    return (itemsMock.where((item) => item.category == category).toList());
  }
}
