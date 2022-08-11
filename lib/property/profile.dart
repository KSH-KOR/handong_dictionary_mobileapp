import 'package:flutter/material.dart';
import 'package:sossu/enums/category.dart';
import 'package:sossu/property/contest.dart';

class Profile{

  final String? name;
  final bool isLogin ;
  List<MyCategory>? favCategory;
  final List<Contest>? favContest;
  final Image? profileImage;

  int followingCount;
  int followerCount;
  

  Profile({
    this.followerCount = 0,
    this.followingCount = 0,
    this.name,
    this.isLogin = false,
    this.favCategory,
    this.favContest,
    this.profileImage,
  });

  void fetchFavCategory(List<bool> selected){
    List<MyCategory> list = [];
    for(int i = 0; i < selected.length; i++){
      if(!selected[i]) continue;
      list.add(MyCategory.values[i]);
    }
    favCategory = list;
  }
}