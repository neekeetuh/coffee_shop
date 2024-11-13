import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';

extension MenuItemsMapper on MenuItemDto {
  MenuItem toModel() {
    return MenuItem(
      id: id,
      title: name,
      price: double.parse(prices[0].value),
      image: imageUrl,
      categoryId: category.id,
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

extension MenuItemModelFromDbDto on MenuItemDbDto {
  MenuItem toModel() {
    return MenuItem(
        id: id,
        title: title,
        image: image,
        price: price,
        categoryId: categoryId);
  }
}
