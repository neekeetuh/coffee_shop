part of 'categories_bloc.dart';

sealed class CategoriesState {
  const CategoriesState();
}

final class InitialCategoriesState extends CategoriesState {
  const InitialCategoriesState();
}

final class LoadingCategoriesState extends CategoriesState {
  const LoadingCategoriesState();
}

final class SuccessfulCategoriesState extends CategoriesState {
  final List<MenuCategory> categories;
  const SuccessfulCategoriesState({required this.categories});
}

final class ErrorCategoriesState extends CategoriesState {
  final Object error;
  const ErrorCategoriesState({required this.error});
}
