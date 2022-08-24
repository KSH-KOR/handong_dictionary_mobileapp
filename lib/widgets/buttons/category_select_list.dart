import 'package:flutter/material.dart';

import '../../enums/dictionary_category.dart';
import 'category_select.dart';

class CategorySelectButtonList extends StatefulWidget {
  const CategorySelectButtonList({Key? key}) : super(key: key);

  @override
  State<CategorySelectButtonList> createState() =>
      _CategorySelectButtonListState();
}

class _CategorySelectButtonListState extends State<CategorySelectButtonList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dictionaryLength(),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CategorySelectButton(
                text: convertEnumToString(DictionaryCategory.values[index]),
                index: index),
          );
        }),
      ),
    );
  }
}
