import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/providers/chosen_category_provider.dart';
import 'package:coffee_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<GlobalKey> categoriesKeys = [];

class CategoriesChoiceBarSliver extends StatelessWidget {
  const CategoriesChoiceBarSliver({
    super.key,
    required this.categories,
  });

  final List<MenuCategory> categories;

  @override
  Widget build(BuildContext context) {
    categoriesKeys = List<GlobalKey>.generate(
        categories.length, (index) => GlobalKey(debugLabel: index.toString()));
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16),
      sliver: SliverAppBar(
        scrolledUnderElevation: 0.0,
        pinned: true,
        flexibleSpace: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            bool isActive =
                index == context.watch<ChosenCategoryProvider>().chosenIndex;
            return ChoiceChip(
              key: categoriesKeys[index],
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              selectedColor:
                  isActive ? AppColors.primaryColor : AppColors.white,
              labelStyle: TextStyle(
                  color: isActive ? AppColors.white : AppColors.black,
                  fontSize: 14),
              label: Text(categories[index].title),
              selected: isActive,
              showCheckmark: false,
              onSelected: (value) {
                _onSelectedCategory(context, index);
              },
              side: BorderSide.none,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 8,
            );
          },
        ),
      ),
    );
  }

  void _onSelectedCategory(BuildContext context, int index) {
    final chosenCategoryProvider = context.read<ChosenCategoryProvider>();
    if (chosenCategoryProvider.chosenIndex != index) {
      chosenCategoryProvider.setChosenIndex(index);
      ensureVIsibleByKey(
          key: categoriesKeys[chosenCategoryProvider.chosenIndex]);
      ensureVIsibleByKey(
          key: categoriesSectionsKeys[chosenCategoryProvider.chosenIndex],
          alignment: getAppBarHeight() / MediaQuery.sizeOf(context).height);
    }
  }
}
