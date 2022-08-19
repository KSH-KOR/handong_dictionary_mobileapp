import 'package:flutter/material.dart';
import 'package:hdict/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: '삭제하시겠습니까?',
    content: '영구히 삭제됩니다.',
    optionsBuilder: () => {
      '취소': false,
      '삭제': true,
    },
  ).then(
    (value) => value ?? false,
  );
}