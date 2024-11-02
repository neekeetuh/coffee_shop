import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor),
        child: const Text(
          'Оформить заказ',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
