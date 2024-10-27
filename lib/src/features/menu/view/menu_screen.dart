import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/categories_choice_bar.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/category_section_sliver.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final List<MenuCategory> categories;
  const MenuScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CategoriesChoiceBarSliver(categories: categories),
            for (var category in categories) ...[
              CategorySectionSliver(category: category)
            ]
          ],
        ),
      ),
    );
  }
}
