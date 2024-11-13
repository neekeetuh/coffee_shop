import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';

class MenuItemWithCategoryDbDto implements IMenuItemDto {
  final MenuItemDbDto menuItemDbDto;
  final MenuCategoryDbDto menuCategoryDbDto;

  const MenuItemWithCategoryDbDto({
    required this.menuItemDbDto,
    required this.menuCategoryDbDto,
  });
}
