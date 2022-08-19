import 'package:flutter/material.dart';

import '../../services/cloud/cloud_dictionary.dart';
import '../../utilities/dialogs/delete_dialog.dart';

typedef DictionaryCallback = void Function(CloudDictionary note);

class DictionariesListView extends StatelessWidget {
  final Iterable<CloudDictionary> notes;
  final DictionaryCallback onDeleteNote;
  final DictionaryCallback onTap;

  const DictionariesListView({
    Key? key,
    required this.notes,
    required this.onTap,
    required this.onDeleteNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return ListTile(
          onTap: () {
            onTap(note);
          },
          title: Text(
            note.word,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                onDeleteNote(note);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}