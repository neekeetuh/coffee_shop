part of 'categories_bloc.dart';

sealed class CategoriesEvent {
  const CategoriesEvent();
}

final class LoadCategoriesEvent extends CategoriesEvent {
  const LoadCategoriesEvent();
}
