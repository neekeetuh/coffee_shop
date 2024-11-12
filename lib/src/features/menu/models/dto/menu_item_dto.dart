import 'package:coffee_shop/src/features/menu/models/dto/menu_category_dto.dart';
import 'package:coffee_shop/src/features/menu/models/dto/price_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuItemDto {
  const MenuItemDto(this.id, this.name, this.description, this.category,
      this.imageUrl, this.prices);
  final int id;
  final String name;
  final String description;
  final MenuCategoryDto category;
  final String imageUrl;
  final List<PriceDto> prices;

  factory MenuItemDto.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemDtoToJson(this);
}
