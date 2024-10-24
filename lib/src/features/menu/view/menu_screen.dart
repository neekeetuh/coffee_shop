import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuCategory> categories;
  const MenuScreen({super.key, required this.categories});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int chosenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 16),
              sliver: SliverAppBar(
                pinned: true,
                flexibleSpace: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    bool isActive = index == chosenIndex;
                    return ChoiceChip(
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      selectedColor: isActive ? AppColors.primaryColor : Colors.white,
                      labelStyle: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontSize: 14),
                      label: Text(widget.categories[index].title),
                      selected: isActive,
                      showCheckmark: false,
                      onSelected: (value) {
                        _setChosenIndex(index);
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
            ),
          ],
        ),
      ),
    );
  }

  void _setChosenIndex(int index) {
    setState(() {
      chosenIndex = index;
    });
  }
}
