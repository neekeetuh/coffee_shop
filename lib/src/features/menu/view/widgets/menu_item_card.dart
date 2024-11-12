import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/providers/cart_provider.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/cart_control_button.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/price_button.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              height: 100,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, _, __) => Image.asset(
                  ImageSources.coffeeDefault,
                  height: 100,
                  fit: BoxFit.fitWidth),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            context.watch<CartProvider>().amountOfItem(item) == 0
                ? PriceButton(
                    price: item.price,
                    onPressed: () => _increaseAmount(context),
                  )
                : CartControlButton(
                    count: context.watch<CartProvider>().amountOfItem(item),
                    onIncrease: () => _increaseAmount(context),
                    onDecrease: () => _decreaseAmount(context),
                  ),
          ],
        ),
      ),
    );
  }

  void _increaseAmount(BuildContext context) {
    context.read<CartProvider>().addItem(item);
  }

  void _decreaseAmount(BuildContext context) {
    context.read<CartProvider>().removeItem(item);
  }
}
