import 'package:json_annotation/json_annotation.dart';

part 'menu_category_dto.g.dart';

abstract interface class IMenuCategoryDto {}

@JsonSerializable()
class MenuCategoryDto implements IMenuCategoryDto {
  const MenuCategoryDto(this.id, this.slug);
  final int id;
  final String slug;

  factory MenuCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryDtoToJson(this);
}
