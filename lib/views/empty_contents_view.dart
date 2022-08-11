import 'package:flutter/material.dart';

class EmptyContentsPage extends StatelessWidget {
  const EmptyContentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: const Text('empty'),
      ),
    );
  }
}