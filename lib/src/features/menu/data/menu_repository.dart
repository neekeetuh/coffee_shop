import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';

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

final itemsMock = <MenuItem>[
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffeeTemplate,
      price: 50,
      category: categoriesMock[0]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe1,
      price: 30,
      category: categoriesMock[0]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffe2,
      price: 50,
      category: categoriesMock[0]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe3,
      price: 30,
      category: categoriesMock[0]),
  MenuItem(
      title: 'Латте',
      image: ImageSources.coffe4,
      price: 50,
      category: categoriesMock[0]),
  MenuItem(
      title: 'Мокка',
      image: ImageSources.coffe5,
      price: 30,
      category: categoriesMock[0]),
  MenuItem(title: 'Капучино', price: 50, category: categoriesMock[0]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe1,
      price: 30,
      category: categoriesMock[1]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffe2,
      price: 50,
      category: categoriesMock[1]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe3,
      price: 30,
      category: categoriesMock[2]),
  MenuItem(
      title: 'Латте',
      image: ImageSources.coffe4,
      price: 50,
      category: categoriesMock[2]),
  MenuItem(
      title: 'Мокка',
      image: ImageSources.coffe5,
      price: 30,
      category: categoriesMock[2]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffeeTemplate,
      price: 50,
      category: categoriesMock[3]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe1,
      price: 30,
      category: categoriesMock[3]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffe2,
      price: 50,
      category: categoriesMock[4]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe3,
      price: 30,
      category: categoriesMock[4]),
  MenuItem(
      title: 'Латте',
      image: ImageSources.coffe4,
      price: 50,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Мокка',
      image: ImageSources.coffe5,
      price: 30,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffeeTemplate,
      price: 50,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe1,
      price: 30,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffe2,
      price: 50,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe3,
      price: 30,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Капучино',
      image: ImageSources.coffe2,
      price: 50,
      category: categoriesMock[5]),
  MenuItem(
      title: 'Мокачино',
      image: ImageSources.coffe3,
      price: 30,
      category: categoriesMock[5]),
];
