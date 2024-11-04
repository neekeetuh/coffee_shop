import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<MenuItem> _items = [];

  List<MenuItem> get items => _items;

  bool isEmpty() {
    return items.isEmpty;
  }

  bool isNotEmpty() {
    return items.isNotEmpty;
  }

  int amountOfItem(MenuItem item) {
    return itemsMap[item.id.toString()] ?? 0;
  }

  void addItem(MenuItem item) {
    if (amountOfItem(item) >= 10) return;
    _items.add(item);
    notifyListeners();
  }

  void removeItem(MenuItem item) {
    if (amountOfItem(item) == 0) return;
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  Map<String, int> get itemsMap {
    Map<String, int> map = {};
    for (var item in _items) {
      map.update(item.id.toString(), (value) => value + 1, ifAbsent: () => 1);
    }
    return map;
  }
}
