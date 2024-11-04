import 'package:coffee_shop/src/features/menu/providers/cart_provider.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/cart_bottom_sheet.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartProvider>();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => ChangeNotifierProvider.value(
              value: cartProvider, child: const CartBottomSheet()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageSources.cartIcon,
                height: 21,
                width: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$price P',
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
