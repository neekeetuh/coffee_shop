import 'dart:async';
import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

const _pageLimit = 50;

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ICategoryRepository _categoryRepository;
  final IMenuRepository _menuRepository;

  MenuBloc(
      {required ICategoryRepository categoryRepository,
      required IMenuRepository menuRepository})
      : _menuRepository = menuRepository,
        _categoryRepository = categoryRepository,
        super(const IdleMenuState()) {
    on<MenuEvent>((event, emit) async {
      switch (event) {
        case LoadCategoriesEvent():
          await _onLoadCategoriesEvent(event, emit);
        case LoadItemsEvent():
          await _onLoadItemsEvent(event, emit);
        case MakeOrderEvent():
          await _onMakeOrderEvent(event, emit);
      }
    });
  }

  Future<void> _onLoadCategoriesEvent(
      LoadCategoriesEvent event, Emitter<MenuState> emit) async {
    emit(LoadingMenuState(items: state.items, categories: state.categories));
    try {
      final categories = await _categoryRepository.loadCategories();
      emit(SuccessfulMenuState(categories: categories, items: state.items));
    } on Exception catch (e) {
      emit(ErrorMenuState(error: e));
    } finally {
      emit(IdleMenuState(categories: state.categories, items: state.items));
    }
  }

  Future<void> _onLoadItemsEvent(
      LoadItemsEvent event, Emitter<MenuState> emit) async {
    emit(LoadingMenuState(items: state.items, categories: state.categories));
    try {
      final items = await _menuRepository.loadAllItems(limit: _pageLimit);
      emit(SuccessfulMenuState(items: items, categories: state.categories));
    } on Exception catch (e) {
      emit(ErrorMenuState(error: e));
    } finally {
      emit(IdleMenuState(categories: state.categories, items: state.items));
    }
  }

  Future<void> _onMakeOrderEvent(
      MakeOrderEvent event, Emitter<MenuState> emit) async {
    try {
      final orderStatus = await _menuRepository.makeOrder(event.orderMap);
      emit(OrderState(
          items: state.items,
          categories: state.categories,
          isSuccessful: orderStatus));
    } on Exception {
      emit(OrderState(
        items: state.items,
        categories: state.categories,
        isSuccessful: false,
      ));
    } finally {
      emit(IdleMenuState(categories: state.categories, items: state.items));
    }
  }
}
