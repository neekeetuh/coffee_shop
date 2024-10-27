part of 'items_bloc.dart';

sealed class ItemsState {
  const ItemsState();
}

final class InitialItemsState extends ItemsState {
  const InitialItemsState();
}

final class LoadingItemsState extends ItemsState {
  const LoadingItemsState();
}

final class SuccessfulItemsState extends ItemsState {
  final List<MenuItem> items;
  const SuccessfulItemsState({required this.items});
}

final class ErrorItemsState extends ItemsState {
  final Object error;
  const ErrorItemsState({required this.error});
}
