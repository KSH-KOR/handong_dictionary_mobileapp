import 'package:flutter/material.dart';

class QuizSelectProvider with ChangeNotifier {
  int? _currentIndex;

  int? get currentIndex => _currentIndex;

  set currentIndex(int? newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  bool _isSubmitted = false;

  bool get isSubmitted => _isSubmitted;

  set isSubmitted(bool newVal) {
    _isSubmitted = newVal;
    notifyListeners();
  }

  bool _isSelectable = true;

  bool get isSelectable => _isSelectable;

  set isSelectable(bool newVal) {
    _isSelectable = newVal;
    notifyListeners();
  }
  

  String? answer;

  int correctCount = 0;
}