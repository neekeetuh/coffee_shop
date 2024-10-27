import 'dart:async';
import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final ICategoryRepository _categoryRepository;

  CategoriesBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(const InitialCategoriesState()) {
    on<LoadCategoriesEvent>(_onLoadCategoriesEvent);
  }

  FutureOr<void> _onLoadCategoriesEvent(
      LoadCategoriesEvent event, Emitter<CategoriesState> emit) {
    emit(const LoadingCategoriesState());
    try {
      final categories = _categoryRepository.loadCategories();
      emit(SuccessfulCategoriesState(categories: categories));
    } on Exception catch (e) {
      emit(ErrorCategoriesState(error: e));
    }
  }
}
