// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategoryDto _$MenuCategoryDtoFromJson(Map<String, dynamic> json) =>
    MenuCategoryDto(
      (json['id'] as num).toInt(),
      json['slug'] as String,
    );

Map<String, dynamic> _$MenuCategoryDtoToJson(MenuCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
    };
