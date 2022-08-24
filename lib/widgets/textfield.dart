
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/textfield_provider.dart';
import '../theme/app_colors.dart';
import '../theme/text_theme.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.textEditingController,
    this.hasPrefixIcon = false,
    this.hintText,
    this.height,
    this.maxLines, this.isAutoFocused = false,
  })
      : super(key: key);

  final TextEditingController textEditingController;
  final bool hasPrefixIcon;
  final String? hintText;
  final double? height;
  final int? maxLines;
  final bool isAutoFocused;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TextFieldProvider>(context);
    return TextField(
      onChanged: (text) {setState(() {
        provider.currentText = text;
      });},
        style: AppTextStyles.body7.copyWith(color: AppColors.textColorWith60Alpha),
        autofocus: widget.isAutoFocused,
        cursorColor: AppColors.primaryColor,
        cursorWidth: 2,
        maxLines: widget.maxLines,
        controller: widget.textEditingController,
        
        decoration: InputDecoration(
          
          prefixIcon: widget.hasPrefixIcon ? const Icon(
            Icons.search,
            color: AppColors.searchIcon,
          ) : null,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.body7.copyWith(color: AppColors.textColorWith80Alpha),
          fillColor: AppColors.searchBarColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.searchBarColor),
            borderRadius: BorderRadius.circular(13),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.searchBarColor),
            borderRadius: BorderRadius.circular(13),
          ),
          contentPadding: EdgeInsets.fromLTRB(21, widget.height ?? 12, 0, widget.height ?? 12),
        ),
        
      
    );
  }
}
