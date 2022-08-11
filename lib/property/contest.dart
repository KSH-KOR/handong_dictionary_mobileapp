import 'package:flutter/material.dart';
import 'package:sossu/enums/category.dart';

class Contest {
  final Image? image;
  final String? title;
  final List<MyCategory> categoryList;

  Contest({this.image, required this.title, required this.categoryList});

  void addCategory({required MyCategory category}) {
    categoryList.add(category);
  }

  void removeCategory({required MyCategory category}) {
    categoryList.remove(category);
  }
}

class ContestList {
  ContestList._sharedInstance();
  static final ContestList _shared = ContestList._sharedInstance();
  factory ContestList() => _shared;

  final List<Contest> _contestList = [
    Contest(
      title: '공모전1',
      categoryList: [MyCategory.ad],
      image: Image.asset('assets/images/공모전1.jpg'),
    ),
    Contest(
      title: '공모전2',
      categoryList: [MyCategory.ad, MyCategory.character],
      image: Image.asset('assets/images/공모전2.jpg'),
    ),
    Contest(
      title: '공모전3',
      categoryList: [MyCategory.ad, MyCategory.construct],
      image: Image.asset('assets/images/공모전3.jpg'),
    ),
    Contest(
      title: '공모전4',
      categoryList: [MyCategory.ad, MyCategory.naming],
      image: Image.asset('assets/images/공모전4.jpg'),
    ),
    Contest(
      title: '공모전5',
      categoryList: [MyCategory.ad, MyCategory.science],
      image: Image.asset('assets/images/공모전5.jpg'),
    ),
  ];

  int get length => _contestList.length;

  int specificCategoryLength(MyCategory myCategory) {
    return _contestList
        .where((contest) => contest.categoryList.contains(myCategory))
        .length;
  }

  List<Contest> specificCategory(MyCategory myCategory) {
    return _contestList
        .where((contest) => contest.categoryList.contains(myCategory))
        .toList();
  }

  void add({required Contest contest}) {
    _contestList.add(contest);
  }

  void remove({required Contest contest}) {
    _contestList.remove(contest);
  }

  Contest? contest({required int atIndex}) =>
      length > atIndex ? _contestList[atIndex] : null;
}
