import 'package:flutter/material.dart';
import 'package:sossu/enums/category.dart';

class Contest{
  late final Image image;
  late final String? title;
  final List<MyCategory> _category = [];

  int get categoryLength => _category.length;
  List<MyCategory> get category => _category;
}

class ContestList{
  ContestList._sharedInstance();
  static final ContestList _shared = ContestList._sharedInstance();
  factory ContestList() => _shared;

  final List<Contest> _contestList = [];

   int get length => _contestList.length;

  void add({required Contest contest}){
    _contestList.add(contest);
  }

  void remove({required Contest contest}){
    _contestList.remove(contest);
  }

  Contest? contest({required int atIndex}) =>
      length > atIndex ? _contestList[atIndex] : null;
}

