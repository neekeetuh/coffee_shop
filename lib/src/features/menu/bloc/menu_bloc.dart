import 'dart:async';
import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ICategoryRepository _categoryRepository;
  final IMenuRepository _menuRepository;

  MenuBloc(
      {required CategoryRepository categoryRepository,
      required IMenuRepository menuRepository})
      : _menuRepository = menuRepository,
        _categoryRepository = categoryRepository,
        super(const InitialMenuState()) {
    on<MenuEvent>((event, emit) async {
      switch (event) {
        case LoadCategoriesEvent():
           await _onLoadCategoriesEvent(event, emit);
        case LoadItemsEvent():
          await _onLoadItemsEvent(event, emit);
      }
    });
  }

  Future <void> _onLoadCategoriesEvent(
      LoadCategoriesEvent event, Emitter<MenuState> emit) async {
    emit(const LoadingMenuState());
    try {
      final categories = await _categoryRepository.loadCategories();
      //TODO: fix the bug (it doesnt work without this await, the state.categories property is null on ui)
      await Future.delayed(const Duration(microseconds: 0));
      emit(SuccessfulMenuState(categories: categories, items: state.items));
    } on Exception catch (e) {
      emit(ErrorMenuState(error: e));
    }
  }

  Future <void> _onLoadItemsEvent(
      LoadItemsEvent event, Emitter<MenuState> emit) async {
    emit(const LoadingMenuState());
    try {
      final items = await _menuRepository.loadAllItems();
      emit(SuccessfulMenuState(items: items, categories: state.categories));
    } on Exception catch (e) {
      emit(ErrorMenuState(error: e));
    }
  }
}
