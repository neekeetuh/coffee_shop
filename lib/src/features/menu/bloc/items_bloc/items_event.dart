part of 'items_bloc.dart';

sealed class ItemsEvent {
  const ItemsEvent();
}

final class LoadItemsEvent extends ItemsEvent {
  final MenuCategory category;
  const LoadItemsEvent({required this.category});
}
