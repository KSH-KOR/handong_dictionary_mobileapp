import 'package:flutter/material.dart';
import 'package:sossu/enums/category.dart';
import 'package:sossu/services/auth/auth_service.dart';
import 'package:sossu/utilities/category_enum_to_string.dart';
import 'package:sossu/utilities/helper_widgets.dart';

class CategorySelectView extends StatefulWidget {
  const CategorySelectView({Key? key}) : super(key: key);

  @override
  State<CategorySelectView> createState() => _CategorySelectViewState();
}

class _CategorySelectViewState extends State<CategorySelectView> {
  late List<bool> _selected;

  @override
  void initState() {
    _selected = List<bool>.generate(MyCategory.values.length, (_) => false);
    super.initState();
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  void _toggle(int index) {
    if (true) {
      setState(() {
        _selected[index] = !_selected[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const int crossAxisCount = 2;
    const double itemHeight = 150;
    final double itemWidth = size.width / crossAxisCount;

    return Scaffold(
        body: ListView(
          children: [
            addVerticalSpace(100),
            GridView.builder(
                shrinkWrap: true,
                itemCount: MyCategory.values.length,
                controller: ScrollController(keepScrollOffset: false),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: crossAxisCount),
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => _toggle(index),
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selected[index]
                                  ? const Color.fromARGB(255, 120, 120, 120)
                                  : const Color.fromARGB(255, 205, 205, 205)),
                          child: const Center(
                            child: Text('사진'),
                          ),
                        ),
                      ),
                      Text(convertCategoryToString(MyCategory.values[index])),
                    ],
                  );
                }),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 100,
              height: 35,
              child: FloatingActionButton(
                elevation: 0,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero),
                backgroundColor: Colors.grey,
                onPressed: () {
                  final user = AuthService.firebase().currentUser;
                  user!.profile.fetchFavCategory(_selected);
                  print(user.profile.favCategory);
                },
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            addVerticalSpace(20),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
