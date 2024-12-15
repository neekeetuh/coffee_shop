import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({
    super.key,
    required this.price,
    required this.onPressed,
  });

  final double price;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.center,
        width: double.infinity,
        height: 24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor),
        child: Text(
          AppLocalizations.of(context)!.priceAlt(price),
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
