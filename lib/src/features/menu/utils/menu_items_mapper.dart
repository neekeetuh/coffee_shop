import 'package:coffee_shop/src/common/data/databases/drift_database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
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

extension DtoToDataClassMapper on MenuItemDto {
  MenuItemDataClass toDataClass() {
    return MenuItemDataClass(
      id: id,
      title: name,
      image: imageUrl,
      price: prices[0],
      categoryId: category.id,
      description: description,
    );
  }
}

extension MenuItemWithCategoryToDtoMapper on MenuItemWithCategoryData {
  MenuItemDto toDto() {
    return MenuItemDto(
      id: menuItemData.id,
      name: menuItemData.title,
      description: menuItemData.description,
      category: MenuCategoryDto(
          id: menuCategoryData.id, slug: menuCategoryData.title),
      imageUrl: menuItemData.image,
      prices: [menuItemData.price],
    );
  }
}
