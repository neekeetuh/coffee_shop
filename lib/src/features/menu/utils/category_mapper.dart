import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';

extension CategoryMapper on MenuCategoryDto {
  MenuCategory toModel() {
    return MenuCategory(id: id, title: slug);
  }
}

extension DtoToDataClassMapper on MenuCategoryDto {
  MenuCategoryDataClass toDataClass() {
    return MenuCategoryDataClass(id: id, title: slug);
  }
}

extension DataClassToDtoMapper on MenuCategoryDataClass {
  MenuCategoryDto toDto() {
    return MenuCategoryDto(id: id, slug: title);
  }
}
