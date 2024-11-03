// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemDto _$MenuItemDtoFromJson(Map<String, dynamic> json) => MenuItemDto(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['description'] as String,
      MenuCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
      json['imageUrl'] as String,
      (json['prices'] as List<dynamic>)
          .map((e) => PriceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuItemDtoToJson(MenuItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category.toJson(),
      'imageUrl': instance.imageUrl,
      'prices': instance.prices.map((e) => e.toJson()).toList(),
    };
