import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/menu_item_card.dart';
import 'package:flutter/material.dart';

class CategorySectionSliver extends StatelessWidget {
  const CategorySectionSliver({
    super.key,
    required this.category,
    required this.items,
  });

  final MenuCategory category;
  final List<MenuItem> items;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              category.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 196),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return MenuItemCard(item: items[index]);
              },
              childCount: items.length,
            ),
          ),
        ),
      ],
    );
  }
}
