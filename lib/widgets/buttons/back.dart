import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.appbarIconColor,
      ),
    );
  }
}

class SearchBackButton extends StatelessWidget {
  const SearchBackButton({Key? key, required this.textEditingController, required this.onChanged}) : super(key: key);

  final TextEditingController textEditingController;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        textEditingController.clear();
        onChanged();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.appbarIconColor,
      ),
    );
  }
}

