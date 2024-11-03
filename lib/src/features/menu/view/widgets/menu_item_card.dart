import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/src/features/menu/models/menu_item.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/cart_control_button.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/price_button.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';

const maxAmount = 10;

class MenuItemCard extends StatefulWidget {
  const MenuItemCard({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int amount = 0;
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
              imageUrl: widget.item.image,
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
                widget.item.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            amount == 0
                ? PriceButton(
                    price: widget.item.price,
                    onPressed: _increaseAmount,
                  )
                : CartControlButton(
                    count: amount,
                    onIncrease: _increaseAmount,
                    onDecrease: _decreaseAmount,
                  ),
          ],
        ),
      ),
    );
  }

  void _increaseAmount() {
    amount < maxAmount
        ? setState(() {
            amount++;
          })
        : log('the amount is at its max');
  }

  void _decreaseAmount() {
    amount > 0
        ? setState(() {
            amount--;
          })
        : log('the amount is already at its minimum');
  }
}
