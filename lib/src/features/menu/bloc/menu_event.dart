part of 'menu_bloc.dart';

sealed class MenuEvent {
  const MenuEvent();
}

final class LoadCategoriesEvent extends MenuEvent {
  const LoadCategoriesEvent();
}

final class LoadItemsEvent extends MenuEvent {
  const LoadItemsEvent();
}
