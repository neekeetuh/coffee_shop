import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/providers/chosen_category_provider.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesChoiceBarSliver extends StatelessWidget {
  const CategoriesChoiceBarSliver({
    super.key,
    required this.categories,
  });

  final List<MenuCategory> categories;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16),
      sliver: SliverAppBar(
        scrolledUnderElevation: 0.0,
        pinned: true,
        flexibleSpace: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            bool isActive = index ==
                context.watch<ChosenCategoryProvider>().chosenIndex;
            return ChoiceChip(
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
                context
                    .read<ChosenCategoryProvider>()
                    .setChosenIndex(index);
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
}