import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  String _currentText = '';

  String get currentText => _currentText;

  set currentText(String newText) {
    _currentText = newText;
    notifyListeners();
  }
}