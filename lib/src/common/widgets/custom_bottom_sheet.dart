import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.content,
    required this.height,
  });

  final Widget content;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(0, -2))
        ],
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white,
      ),
      height: height,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 4,
            width: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: AppColors.grey),
          ),
          content
        ],
      ),
    );
  }
}
