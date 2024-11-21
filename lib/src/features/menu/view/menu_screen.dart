import 'package:coffee_shop/src/features/menu/bloc/menu_bloc.dart';
import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/savable_categories_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/data_sources/savable_menu_data_source.dart';
import 'package:coffee_shop/src/features/menu/data/database/database.dart';
import 'package:coffee_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffee_shop/src/features/menu/models/menu_category.dart';
import 'package:coffee_shop/src/features/menu/providers/cart_provider.dart';
import 'package:coffee_shop/src/features/menu/providers/chosen_category_provider.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/cart_button.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/categories_choice_bar_sliver.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/category_section_sliver.dart';
import 'package:coffee_shop/src/features/locations/view/widgets/selected_location_sliver.dart';
import 'package:dio/dio.dart';
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

//TODO: initialize using di container
final dio = Dio();

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChosenCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        )
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => CategoryRepository(
                    networkCategoriesDataSource:
                        NetworkCategoriesDataSource(dio: dio),
                    dbCategoriesDataSource: DbCategoriesDataSource(
                        menuDb: context.read<MenuDatabase>()),
                  )),
          RepositoryProvider(
              create: (context) => MenuRepository(
                  networkMenuDataSource: NetworkMenuDataSource(dio: dio),
                  dbMenuItemsDataSource:
                      DbMenuDataSource(menuDb: context.read<MenuDatabase>()))),
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
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MenuBloc, MenuState>(
          listener: (context, state) {
            if (state is IdleMenuState && state.items == null) {
              context.read<MenuBloc>().add(const LoadItemsEvent());
            }
          },
          builder: (context, state) {
            final List<MenuCategory> categories = state.categories ?? [];
            categoriesSectionsKeys = List<GlobalKey>.generate(categories.length,
                (index) => GlobalKey(debugLabel: index.toString()));
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) =>
                  _onScrollNotification(context, scrollInfo),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomScrollView(
                    slivers: [
                      const SelectedLocationSliver(
                        location: 'Ленина, 15',
                      ),
                      CategoriesChoiceBarSliver(
                          key: appBarKey, categories: categories),
                      ...List.generate(categories.length, (int i) {
                        final items = state.items
                            ?.where(
                                (item) => item.category.id == categories[i].id)
                            .toList();
                        if (items?.isEmpty ?? true) {
                          return const SliverToBoxAdapter(
                              child: SizedBox.shrink());
                        }
                        return CategorySectionSliver(
                          key: categoriesSectionsKeys[i],
                          category: categories[i],
                          items: items ?? [],
                        );
                      }),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 16,
                        ),
                      ),
                      if (state is LoadingMenuState) ...[
                        const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ]
                    ],
                  ),
                  context.watch<CartProvider>().isNotEmpty()
                      ? CartButton(
                          price: context.watch<CartProvider>().totalPrice,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
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
