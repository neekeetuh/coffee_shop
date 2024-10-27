import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';

abstract interface class IMenuRepository {
  Future<List<MenuItem>> loadCategoryItems(MenuCategory category);
  Future<List<MenuItem>> loadAllItems();
}

final class MenuRepository implements IMenuRepository {
  const MenuRepository();
  @override
  Future<List<MenuItem>> loadCategoryItems(MenuCategory category) async {
    // TODO: implement method
    return (itemsMock.where((item) => item.category == category).toList());
  }

  @override
  Future<List<MenuItem>> loadAllItems() async {
    return itemsMock;
  }
}
