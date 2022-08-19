import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../enums/dictionary_category.dart';
import '../../services/cloud/cloud_dictionary.dart';
import '../../services/cloud/firebase_cloud_storage.dart';
import '../../services/search_view_provider.dart';
import 'dictionary_list_view.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key}) : super(key: key);

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {

  late final FirebaseCloudStorage _dictionaryService;

  @override
  void initState() {
    _dictionaryService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchViewProvider>(context);
    return StreamBuilder(
        stream: _dictionaryService.specificCategoryDictionaries(DictionaryCategory.values[provider.currentIndex]),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allNotes = snapshot.data as Iterable<CloudDictionary>;
                return DictionariesListView(
                  notes: allNotes,
                  onDeleteNote: (note) async {
                    await _dictionaryService.deleteNote(documentId: note.documentId);
                  },
                  onTap: (note) {
                    Navigator.of(context).pushNamed(
                      homeRoute,
                      arguments: note,
                    );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      );
    
  }
}