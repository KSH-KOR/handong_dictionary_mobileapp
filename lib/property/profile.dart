import 'package:sossu/enums/category.dart';
import 'package:sossu/property/contest_info.dart';

class Profile{

  final String? name;
  final bool isLogin ;
  List<MyCategory>? favCategory;
  final List<Contest>? favContest;

  Profile({this.name, this.isLogin = false, this.favCategory, this.favContest});

  void fetchFavCategory(List<bool> selected){
    List<MyCategory> list = [];
    for(int i = 0; i < selected.length; i++){
      if(!selected[i]) continue;
      list.add(MyCategory.values[i]);
    }
    favCategory = list;
  }
}