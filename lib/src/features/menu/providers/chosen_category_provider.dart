import 'package:flutter/material.dart';

class ChosenCategoryProvider with ChangeNotifier {
  int _chosenIndex = 0;
  int get chosenIndex => _chosenIndex;

  void setChosenIndex(int index) {
    _chosenIndex = index;
    notifyListeners();
  }
}
