
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/search_view_provider.dart';
import '../../theme/app_colors.dart';
import '../../utilities/helper_widgets.dart';

class CategorySelectButton extends StatefulWidget {
  const CategorySelectButton(
      {Key? key, required this.text, required this.index})
      : super(key: key);

  final String text;
  final int index;

  @override
  State<CategorySelectButton> createState() => _CategorySelectButtonState();
}

class _CategorySelectButtonState extends State<CategorySelectButton> {
  bool isSelected = false;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchViewProvider>(context);

    isSelected = widget.index == provider.currentIndex;
    color = isSelected ? Colors.black : Colors.grey;

    return GestureDetector(
      onTap: () {
        provider.currentIndex = widget.index;
      },
      child: Container(
        color: AppColors.whiteColor,
        width: 70,
        child: Column(
          children: [
            addVerticalSpace(13),
            Text(
              widget.text,
              style: TextStyle(color: color),
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
