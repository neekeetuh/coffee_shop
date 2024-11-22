import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
      onPressed: () => onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
