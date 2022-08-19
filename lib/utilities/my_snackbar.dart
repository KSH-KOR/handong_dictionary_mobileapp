import 'package:flutter/material.dart';

SnackBar mySnackBar({required text}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(50),
    elevation: 10,
    duration: const Duration(milliseconds: 3000),
  );
}
