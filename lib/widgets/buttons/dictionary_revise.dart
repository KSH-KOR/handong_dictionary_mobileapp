
import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../theme/app_colors.dart';

class DictionaryReviseButton extends StatelessWidget {
  const DictionaryReviseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.of(context).pushNamed(reviseRequestRoute),
      icon: Image.asset(
        'assets/image/pencil.png',
        color: AppColors.appbarIconColor,
      ),
    );
  }
}