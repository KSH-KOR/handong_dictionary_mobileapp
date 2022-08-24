import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';

SnackBar mySnackBar({required String text, required Widget icon}) {
  return SnackBar(
    padding: const EdgeInsets.symmetric(vertical: 14),
    backgroundColor: AppColors.snackColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(50),
    elevation: 10,
    duration: const Duration(milliseconds: 3000),
    shape: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.snackColor),
      borderRadius: BorderRadius.circular(13),
    ),
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: icon,
        ),
        Text(
          text,
          style: AppTextStyles.snackBar,
        ),
      ],
    ),
  );
}
