import 'dart:io';

import 'package:coffee_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/savable_menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/models/dto/menu_item_dto.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/utils/menu_items_mapper.dart';

abstract interface class IMenuRepository {
  Future<List<MenuItem>> loadCategoryItems(
      {required MenuCategory category, int page = 0, int limit = 25});
  Future<bool> makeOrder(Map<String, int> orderMap);
}

final class MenuRepository implements IMenuRepository {
  final INetworkMenuDataSource _networkMenuDataSource;
  final ISavableMenuDataSource _dbMenuItemsDataSource;
  const MenuRepository(
      {required ISavableMenuDataSource dbMenuItemsDataSource,
      required INetworkMenuDataSource networkMenuDataSource})
      : _dbMenuItemsDataSource = dbMenuItemsDataSource,
        _networkMenuDataSource = networkMenuDataSource;
  @override
  Future<List<MenuItem>> loadCategoryItems(
      {required MenuCategory category, int page = 0, int limit = 25}) async {
    var dtos = <MenuItemDto>[];
    try {
      dtos = await _networkMenuDataSource.fetchMenuItems(
        categoryId: category.id.toString(),
        page: page,
        limit: limit,
      );
      _dbMenuItemsDataSource.saveMenuItems(items: dtos);
    } on SocketException {
      dtos = await _dbMenuItemsDataSource.fetchMenuItems(
          categoryId: category.id.toString(), page: page, limit: limit);
    }
    return dtos.map((dto) => dto.toModel()).toList();
  }

  @override
  Future<bool> makeOrder(Map<String, int> orderMap) async {
    return _networkMenuDataSource.makeOrder(orderMap: orderMap);
  }
}
