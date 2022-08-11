import 'package:flutter/material.dart';
import 'package:sossu/enums/category.dart';
import 'package:sossu/property/contest.dart';
import 'package:sossu/utilities/category_enum_to_string.dart';
import 'package:sossu/widgets/bottom_navi_bar.dart';
import 'package:sossu/widgets/contest_gridview.dart';

class ContestListView extends StatefulWidget {
  const ContestListView({Key? key}) : super(key: key);

  @override
  State<ContestListView> createState() => _ContestListViewState();
}

class _ContestListViewState extends State<ContestListView> {
  late final ContestList contestList;
  late int _selectedIndex;

  @override
  void initState() {
    contestList = ContestList();
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: MyCategory.values.length,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(
                    convertCategoryToString(MyCategory.values[index]),
                  ),
                  selected: _selectedIndex == index,
                  selectedColor: const Color.fromARGB(255, 156, 156, 156),
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedIndex = selected ? index : 0;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 210, 210, 210),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          ContestGridView(
            contestList: contestList,
            selectedCategory: MyCategory.values[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavibar(),
    );
  }
}

class BottomNaviBarItemIcon extends StatefulWidget {
  const BottomNaviBarItemIcon({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<BottomNaviBarItemIcon> createState() => _BottomNaviBarItemIconState();
}

class _BottomNaviBarItemIconState extends State<BottomNaviBarItemIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Text(widget.title),
    );
  }
}
