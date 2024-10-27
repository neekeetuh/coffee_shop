import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';

abstract interface class ICategoryRepository {
  Future<List<MenuCategory>> loadCategories();
}

final class CategoryRepository implements ICategoryRepository {
  const CategoryRepository();
  @override
  Future<List<MenuCategory>> loadCategories() async {
    //TODO: implement method
    return categoriesMock;
  }
}
