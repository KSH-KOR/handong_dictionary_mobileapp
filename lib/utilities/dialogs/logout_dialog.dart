
import 'package:flutter/material.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 20),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  '접속중인 기기에서 로그아웃 하시겠습니까?',
                  softWrap: true,
                )),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('취소'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('로그아웃')),
          ],
        );
      }).then((value) => value ?? false);
}
