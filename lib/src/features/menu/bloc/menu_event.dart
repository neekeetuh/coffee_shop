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

final class MakeOrderEvent extends MenuEvent {
  final Map<String, int> orderMap;
  const MakeOrderEvent({required this.orderMap});
}
