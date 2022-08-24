import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  String _currentText = '';

  String get currentText => _currentText;

  set currentText(String newText) {
    _currentText = newText;
    notifyListeners();
  }

  bool _isSearchMode = false;

  bool get isSearchMode => _isSearchMode;

  set isSearchMode(bool newVal) {
    _isSearchMode = newVal;
    notifyListeners();
  }
}