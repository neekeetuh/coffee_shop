part of 'menu_bloc.dart';

sealed class MenuState {
  final List<MenuCategory>? categories;
  final List<MenuItem>? items;
  const MenuState({
    this.categories,
    this.items,
  });
}

final class InitialMenuState extends MenuState {
  const InitialMenuState({
    super.items,
    super.categories,
  });
}

final class LoadingMenuState extends MenuState {
  const LoadingMenuState({
    super.items,
    super.categories,
  });
}

final class SuccessfulMenuState extends MenuState {
  const SuccessfulMenuState({
    super.categories,
    super.items,
  });
}

final class ErrorMenuState extends MenuState {
  final Object error;
  const ErrorMenuState({
    required this.error,
    super.items,
    super.categories,
  });
}
