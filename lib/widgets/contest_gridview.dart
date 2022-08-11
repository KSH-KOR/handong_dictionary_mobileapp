import 'package:flutter/material.dart';
import 'package:sossu/enums/category.dart';
import 'package:sossu/property/contest.dart';
import 'package:sossu/views/empty_contents_view.dart';

class ContestGridView extends StatefulWidget {
  const ContestGridView({
    Key? key,
    this.crossAxisCount = 2,
    this.itemHeight = 150,
    required this.contestList,
    required this.selectedCategory,
  }) : super(key: key);

  final int crossAxisCount;
  final double itemHeight;
  final ContestList contestList;
  final MyCategory selectedCategory;

  @override
  State<ContestGridView> createState() => _ContestGridViewState();
}

class _ContestGridViewState extends State<ContestGridView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const int crossAxisCount = 2;
    const double itemHeight = 260;
    final double itemWidth = size.width / crossAxisCount;

    final int itemCount =
        widget.contestList.specificCategoryLength(widget.selectedCategory);
    final List<Contest> selectedCategoryList =
        widget.contestList.specificCategory(widget.selectedCategory);

    return itemCount == 0
        ? const EmptyContentsPage()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: itemCount,
                controller: ScrollController(keepScrollOffset: false),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: crossAxisCount),
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 167,
                          height: 237,
                          margin: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 205, 205, 205)),
                          child: ContestBox(
                            contest: selectedCategoryList[index],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          );
  }
}

class ContestBox extends StatefulWidget {
  const ContestBox({Key? key, required this.contest}) : super(key: key);

  final Contest contest;

  @override
  State<ContestBox> createState() => _ContestBoxState();
}

class _ContestBoxState extends State<ContestBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          flex: 10,
          child: Container(
            child: widget.contest.image,
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.grey),
            child: Text(widget.contest.title!),
          ),
        ),
      ]),
    );
  }
}
