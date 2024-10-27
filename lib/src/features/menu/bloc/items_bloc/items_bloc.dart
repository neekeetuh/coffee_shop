import 'dart:async';

import 'package:coffee_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final IMenuRepository _menuRepository;
  ItemsBloc({required IMenuRepository menuRepository})
      : _menuRepository = menuRepository,
        super((const InitialItemsState())) {
    on<LoadItemsEvent>(_onLoadItemsEvent);
  }

  FutureOr<void> _onLoadItemsEvent(
      LoadItemsEvent event, Emitter<ItemsState> emit) {
    emit(const LoadingItemsState());
    try {
      final items = _menuRepository.loadMenuItems(event.category);
      emit(SuccessfulItemsState(items: items));
    } on Exception catch (e) {
      emit(ErrorItemsState(error: e));
    }
  }
}
