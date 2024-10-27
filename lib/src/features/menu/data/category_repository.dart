import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';

abstract interface class ICategoryRepository {
  List<MenuCategory> loadCategories();
}

final class CategoryRepository implements ICategoryRepository {
  const CategoryRepository();
  @override
  List<MenuCategory> loadCategories() {
    //TODO: implement method
    return categoriesMock;
  }
}
