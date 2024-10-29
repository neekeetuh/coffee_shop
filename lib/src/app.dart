import 'package:coffee_shop/src/features/menu/bloc/menu_bloc.dart';
import 'package:coffee_shop/src/features/menu/data/category_repository.dart';
import 'package:coffee_shop/src/features/menu/data/menu_repository.dart';
import 'package:coffee_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffee_shop/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => const CategoryRepository()),
          RepositoryProvider(create: (context) => const MenuRepository()),
        ],
        child: BlocProvider(
          create: (context) => MenuBloc(
            categoryRepository: context.read<CategoryRepository>(),
            menuRepository: context.read<MenuRepository>(),
          ),
          child: const MenuScreen(),
        ),
      ),
      theme: mainTheme,
    );
  }
}
