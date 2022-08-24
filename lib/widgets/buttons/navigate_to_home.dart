import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../theme/app_colors.dart';

class NavigateToHomePageButton extends StatelessWidget {
  const NavigateToHomePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false),
      icon: const Icon(
        Icons.home,
        color: AppColors.appbarIconColor,
      ),
    );
  }
}
