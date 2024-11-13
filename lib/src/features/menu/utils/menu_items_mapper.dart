import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_with_category_db_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/utils/category_mapper.dart';

extension MenuItemsMapper on MenuItemDto {
  MenuItem toModel() {
    return MenuItem(
      id: id,
      title: name,
      price: double.parse(prices[0].value),
      image: imageUrl,
      category: category.toModel(),
    );
  }
}

extension DbDtoMapper on MenuItemDto {
  MenuItemDbDto toDbDto(int page, int pageLimit) {
    return MenuItemDbDto(
        id: id,
        title: name,
        image: imageUrl,
        price: double.parse(prices[0].value),
        categoryId: category.id,
        page: page,
        pageLimit: pageLimit);
  }
}

extension MenuItemModelFromDbDto on MenuItemWithCategoryDbDto {
  MenuItem toModel() {
    return MenuItem(
        id: menuItemDbDto.id,
        title: menuItemDbDto.title,
        image: menuItemDbDto.image,
        price: menuItemDbDto.price,
        category: menuCategoryDbDto.toModel());
  }
}
