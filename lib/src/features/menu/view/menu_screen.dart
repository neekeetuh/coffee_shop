import 'package:coffee_shop/src/features/menu/bloc/menu_bloc.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/categories_choice_bar_sliver.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/category_section_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MenuBloc>().add(const LoadCategoriesEvent());
    context.read<MenuBloc>().add(const LoadItemsEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is SuccessfulMenuState) {
              return CustomScrollView(
                slivers: [
                  CategoriesChoiceBarSliver(categories: state.categories ?? []),
                  for (var category in state.categories ?? []) ...[
                    CategorySectionSliver(
                      category: category,
                      items: state.items!
                          .where((item) => item.category == category)
                          .toList(),
                    )
                  ]
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
