
import 'package:sossu/enums/category.dart';

String convertCategoryToString(MyCategory category){
  late final convertedCategory;
  switch(category){
    case MyCategory.idea:
      return '기획/아이디어';
    case MyCategory.ad:
      return '광고/마케팅';
    case MyCategory.ucc:
      return '사진/영상/UCC';
    case MyCategory.design:
      return '디자인/순수미술/공예';
    case MyCategory.naming:
      return '네이밍/슬로건';
    case MyCategory.character:
      return '캐릭터/만화/게임';
    case MyCategory.construct:
      return '건축/건설/인테리어';
    case MyCategory.science:
      return '과학/공학';
  }
}