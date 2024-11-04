import 'dart:io';

import 'package:coffee_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/utils/menu_items_mapper.dart';

abstract interface class IMenuRepository {
  Future<List<MenuItem>> loadCategoryItems(MenuCategory category);
  Future<List<MenuItem>> loadAllItems();
  Future<bool> makeOrder(Map<String, int> orderMap);
}

final class MenuRepository implements IMenuRepository {
  final IMenuDataSource _networkMenuDataSource;
  const MenuRepository({required IMenuDataSource networkMenuDataSource})
      : _networkMenuDataSource = networkMenuDataSource;
  @override
  Future<List<MenuItem>> loadCategoryItems(MenuCategory category) async {
    var dtos = <MenuItemDto>[];
    try {
      dtos = await _networkMenuDataSource.fetchMenuItems(
          categoryId: category.id.toString());
    } on SocketException {
      //TODO: implement getting cached menu items from db
    }
    return dtos as List<MenuItem>;
  }

  @override
  Future<List<MenuItem>> loadAllItems() async {
    // return itemsMock;
    var dtos = <MenuItemDto>[];
    try {
      dtos = await _networkMenuDataSource.fetchMenuItems();
    } on SocketException {
      //TODO: implement getting cached menu items from db
    }
    return dtos.map((dto) => dto.toModel()).toList();
  }

  @override
  Future<bool> makeOrder(Map<String, int> orderMap) async {
    return _networkMenuDataSource.makeOrder(orderMap: orderMap);
  }
}
