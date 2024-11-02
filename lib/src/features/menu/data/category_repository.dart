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

final List<MenuCategory> categoriesMock = <MenuCategory>[
  MenuCategory(title: 'Черный кофе'),
  MenuCategory(title: 'Кофе с молоком'),
  MenuCategory(title: 'Чай'),
  MenuCategory(title: 'Арабика'),
  MenuCategory(title: 'Робуста'),
  MenuCategory(title: 'Либерика'),
];
