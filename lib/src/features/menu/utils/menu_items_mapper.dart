import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
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
