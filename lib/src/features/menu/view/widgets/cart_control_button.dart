import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartControlButton extends StatelessWidget {
  const CartControlButton({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryColor),
            height: 24,
            width: 24,
            child: const Icon(
              Icons.remove,
              size: 16,
              color: AppColors.white,
            ),
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryColor),
            height: 24,
            width: 24,
            child: const Icon(
              Icons.add,
              size: 16,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
