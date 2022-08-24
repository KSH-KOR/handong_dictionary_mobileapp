enum DictionaryCategory {
  total,
  campusLife,
  lecture,
  campusFacility,
  food,
}

String convertEnumToString(DictionaryCategory enumDictionaryCategory){
  switch(enumDictionaryCategory){
    
    case DictionaryCategory.total:
      return '전체';
    case DictionaryCategory.campusLife:
      return '학교생활';
    case DictionaryCategory.lecture:
      return '강의관련';
    case DictionaryCategory.campusFacility:
      return '학교시설';
    case DictionaryCategory.food:
      return '음식';
  }
}
 int dictionaryLength() => DictionaryCategory.values.length;
