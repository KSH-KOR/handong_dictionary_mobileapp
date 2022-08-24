import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utilities/helper_widgets.dart';
import 'buttons/back.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({Key? key, this.hasActionButton, this.leadingButton}) : super(key: key);

  final Widget? hasActionButton;
  final Widget? leadingButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: leadingButton ?? const AppBackButton(),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.appbarIconColor,
        ),
        actions: [
          hasActionButton ?? Container(),
          addHorizontalSpace(24),
        ]
    );
  }
  
  @override
    Size get preferredSize => const Size.fromHeight(64);
}