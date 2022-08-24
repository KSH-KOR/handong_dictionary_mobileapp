import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../enums/dictionary_category.dart';
import '../../services/cloud/models/cloud_dictionary.dart';
import '../../services/cloud/firebase_cloud_dictionary_storage.dart';
import '../../services/search_view_provider.dart';
import 'dictionary_list_view.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key, this.isDevMode = false, this.isSearchMode = false, required this.textEditingController}) : super(key: key);

  final bool isDevMode;
  final bool isSearchMode;
  final TextEditingController textEditingController;

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {

  late final FirebaseCloudDictionaryStorage _dictionaryService;

  @override
  void initState() {
    _dictionaryService = FirebaseCloudDictionaryStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchViewProvider>(context);
    
    return StreamBuilder(
        stream: widget.isSearchMode ? _dictionaryService.contains(widget.textEditingController.text) : _dictionaryService.specificCategoryDictionaries(DictionaryCategory.values[provider.currentIndex]),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allDictionaries = snapshot.data as Iterable<CloudDictionary>;
                return DictionariesListView(
                  isSearchMode: widget.isSearchMode,
                  onDeleteNote: widget.isDevMode ? (dictionary) async {
                    await _dictionaryService.deleteDictionary(documentId: dictionary.documentId);
                  } : null,
                  dictionaries: allDictionaries,
                  onTap: (dictionary) {
                    Navigator.of(context).pushNamed(
                      dictionaryCardRoute,
                      arguments: dictionary,
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