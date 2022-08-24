
import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../theme/app_colors.dart';

class DictionaryAddButton extends StatelessWidget {
  const DictionaryAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.of(context).pushNamed(addRequestRoute),
      icon: Image.asset(
        'assets/image/wordAddButton.png',
        color: AppColors.appbarIconColor,
      ),
    );
  }
}
