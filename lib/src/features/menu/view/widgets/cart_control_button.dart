import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartControlButton extends StatelessWidget {
  const CartControlButton({
    super.key,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  final int count;
  final void Function() onIncrease;
  final void Function() onDecrease;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChangeAmountButton(
            icon: Icons.remove,
            onTap: onDecrease,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryColor),
              height: 24,
              child: Text(
                '$count',
                style: const TextStyle(color: AppColors.white),
              ),
            ),
          ),
          ChangeAmountButton(
            icon: Icons.add,
            onTap: onIncrease,
          ),
        ],
      ),
    );
  }
}

class ChangeAmountButton extends StatelessWidget {
  const ChangeAmountButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor),
        height: 24,
        width: 24,
        child: Icon(
          icon,
          size: 16,
          color: AppColors.white,
        ),
      ),
    );
  }
}
