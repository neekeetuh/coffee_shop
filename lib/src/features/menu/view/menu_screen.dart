import 'package:coffee_shop/src/features/menu/bloc/menu_bloc.dart';
import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/providers/chosen_category_provider.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/cart_button.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/categories_choice_bar_sliver.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/category_section_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

List<GlobalKey> categoriesSectionsKeys = [];
List<double> categoriesSectionsHeights = [];
GlobalKey appBarKey = GlobalKey();

double getAppBarHeight() {
  return appBarKey.currentContext?.findRenderObject()?.semanticBounds.height ??
      0;
}

void _setCategoriesSectionsHeights() {
  categoriesSectionsHeights = categoriesSectionsKeys.map((key) {
    return (key.currentContext?.findRenderObject()?.semanticBounds.height) ?? 0;
  }).toList();
}

void ensureVIsibleByKey({
  required GlobalKey key,
  double alignment = 0,
  Duration duration = const Duration(milliseconds: 200),
  Curve curve = Curves.ease,
  ScrollPositionAlignmentPolicy alignmentPolicy =
      ScrollPositionAlignmentPolicy.explicit,
}) {
  final currentContext = key.currentContext;
  if (currentContext != null) {
    Scrollable.ensureVisible(
      currentContext,
      alignment: alignment,
      duration: duration,
      curve: curve,
      alignmentPolicy: alignmentPolicy,
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChosenCategoryProvider(),
        )
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => const CategoryRepository()),
          RepositoryProvider(create: (context) => const MenuRepository()),
        ],
        child: BlocProvider(
          create: (context) => MenuBloc(
            categoryRepository: context.read<CategoryRepository>(),
            menuRepository: context.read<MenuRepository>(),
          ),
          child: const MenuScreenView(),
        ),
      ),
    );
  }
}

class MenuScreenView extends StatelessWidget {
  const MenuScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MenuBloc>().add(const LoadCategoriesEvent());
    context.read<MenuBloc>().add(const LoadItemsEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is SuccessfulMenuState) {
              final List<MenuCategory> categories = state.categories ?? [];
              categoriesSectionsKeys = List<GlobalKey>.generate(
                  categories.length,
                  (index) => GlobalKey(debugLabel: index.toString()));
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) =>
                    _onScrollNotification(context, scrollInfo),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomScrollView(
                      slivers: [
                        CategoriesChoiceBarSliver(
                            key: appBarKey, categories: categories),
                        ...List.generate(
                            categories.length,
                            (int i) => CategorySectionSliver(
                                  key: categoriesSectionsKeys[i],
                                  category: categories[i],
                                  items: state.items!
                                      .where((item) =>
                                          item.category == categories[i])
                                      .toList(),
                                )),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16,
                          ),
                        )
                      ],
                    ),
                    const CartButton(
                      price: 139,
                    ),
                  ],
                ),
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

  bool _onScrollNotification(
    BuildContext context,
    ScrollNotification scrollInfo,
  ) {
    _setCategoriesSectionsHeights();
    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.axis == Axis.vertical) {
      int firstVisibleSectionIndex = -1;
      if (categoriesSectionsHeights.isNotEmpty) {
        final firstVisibleSectionHeight =
            categoriesSectionsHeights.firstWhere((value) => value > 0);
        firstVisibleSectionIndex = categoriesSectionsHeights
            .indexWhere((value) => value == firstVisibleSectionHeight);
      }
      if (scrollInfo.metrics.pixels < getAppBarHeight()) {
        context
            .read<ChosenCategoryProvider>()
            .setChosenIndex(firstVisibleSectionIndex);
        ensureVIsibleByKey(key: categoriesKeys[firstVisibleSectionIndex]);
        return false;
      }
      if (firstVisibleSectionIndex < categoriesSectionsHeights.length - 1) {
        context
            .read<ChosenCategoryProvider>()
            .setChosenIndex(firstVisibleSectionIndex + 1);
        ensureVIsibleByKey(key: categoriesKeys[firstVisibleSectionIndex + 1]);
      }
    }
    return false;
  }
}
