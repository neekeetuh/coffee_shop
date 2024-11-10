import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final class SnackBarService {
  static Future<void> showSnackBar(BuildContext context, String message) async {
    final SnackBar snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        backgroundColor: AppColors.secondaryColor,
        content: Text(
          message,
          style: const TextStyle(fontSize: 20, color: AppColors.white),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
