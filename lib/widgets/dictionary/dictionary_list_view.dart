import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';

import '../../services/cloud/models/cloud_dictionary.dart';
import '../../utilities/dialogs/delete_dialog.dart';

typedef DictionaryCallback = void Function(CloudDictionary note);

class DictionariesListView extends StatelessWidget {
  const DictionariesListView({
    Key? key,
    required this.dictionaries,
    required this.onTap,
    this.onDeleteNote,
    this.isSearchMode = false,
  }) : super(key: key);

  final Iterable<CloudDictionary> dictionaries;
  final DictionaryCallback? onDeleteNote;
  final DictionaryCallback onTap;
  final bool isSearchMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color:
              isSearchMode ? AppColors.whiteColor : AppColors.searchBarColor),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: dictionaries.length,
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          color: AppColors.betweenWord,
        ),
        itemBuilder: (context, index) {
          final note = dictionaries.elementAt(index);
          return ListTile(
            visualDensity: isSearchMode ? VisualDensity.compact : VisualDensity.comfortable,
              dense: isSearchMode,
              contentPadding: EdgeInsets.only(
                  left: isSearchMode ? 0 : 21,
                  bottom: 0),
              onTap: () {
                onTap(note);
              },
              title: Text(
                note.word,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body5,
              ),
              trailing: onDeleteNote == null
                  ? null
                  : IconButton(
                      onPressed: () async {
                        final shouldDelete = await showDeleteDialog(context);
                        if (shouldDelete) {
                          onDeleteNote!(note);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ));
        },
      ),
    );
  }
}
