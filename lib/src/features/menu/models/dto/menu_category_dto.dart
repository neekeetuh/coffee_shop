import 'package:json_annotation/json_annotation.dart';

part 'menu_category_dto.g.dart';

@JsonSerializable()
class MenuCategoryDto {
  const MenuCategoryDto({required this.id, required this.slug});
  final int id;
  final String slug;

  factory MenuCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryDtoToJson(this);
}
