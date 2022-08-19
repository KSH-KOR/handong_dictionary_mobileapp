import 'package:flutter/material.dart';
import 'package:hdict/widgets/dictionary/dictionary_view.dart';
import 'package:uuid/uuid.dart';
import '../services/cloud/firebase_cloud_storage.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {

  late final FirebaseCloudStorage _dictionaryService;
  
  @override
  void initState() {
    _dictionaryService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await _dictionaryService.createNewNote(
                word: '갈상',
                category: '학교시설',
                meaning: '강대상자',
                subMeaning: '',
                uses: '',
                wordId: const Uuid().v4(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const DictionaryView(),
    );
  }
}