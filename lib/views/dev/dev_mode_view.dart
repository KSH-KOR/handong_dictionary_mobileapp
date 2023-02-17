import 'package:flutter/material.dart';
import 'package:hdict/widgets/dictionary/dictionary_view.dart';
import 'package:uuid/uuid.dart';
import '../../services/cloud/firebase_cloud_dictionary_storage.dart';
import '../../widgets/buttons/category_select_list.dart';

class DevSearchView extends StatefulWidget {
  const DevSearchView({Key? key}) : super(key: key);

  @override
  State<DevSearchView> createState() => _DevSearchViewState();
}

class _DevSearchViewState extends State<DevSearchView> {
  late final FirebaseCloudDictionaryStorage _dictionaryService;
  late final TextEditingController _wordTextEditingController;
  late final TextEditingController _categoryTextEditingController;
  late final TextEditingController _meaningTextEditingController;
  late final TextEditingController _subMeaningTextEditingController;
  late final TextEditingController _usesTextEditingController;

  late final TextEditingController _searchTextEditingController;  

  @override
  void initState() {
    _dictionaryService = FirebaseCloudDictionaryStorage();
    _wordTextEditingController = TextEditingController();
    _categoryTextEditingController = TextEditingController();
    _meaningTextEditingController = TextEditingController();
    _subMeaningTextEditingController = TextEditingController();
    _usesTextEditingController = TextEditingController();
    _searchTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _wordTextEditingController.dispose();
    _categoryTextEditingController.dispose();
    _meaningTextEditingController.dispose();
    _subMeaningTextEditingController.dispose();
    _usesTextEditingController.dispose();
    _searchTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              // await _dictionaryService.createNewDictionary(
              //   word: _wordTextEditingController.text,
              //   category: _categoryTextEditingController.text,
              //   meaning: _meaningTextEditingController.text,
              //   subMeaning: _subMeaningTextEditingController.text,
              //   uses: _usesTextEditingController.text,
              //   wordId: const Uuid().v4(),
              // );

              // _wordTextEditingController.clear();
              // _meaningTextEditingController.clear();
              // _subMeaningTextEditingController.clear();
              // _usesTextEditingController.clear();
              _dictionaryService.createNewDictionary(
                word: '한한',
                category: '학교생활',
                meaning: '한동 한바퀴를 의미함.',
                subMeaning: '한동대학교를 기준으로 가장자리에 있는 건물들을 도는 것을 말함. 그레이스 스쿨은 오르막길로 인해서 포함되지 않는 경우가 일반적임.',
                uses: '학생1 : 얘들아 밥도 먹었는데 우리 좀 걸을까 ?*학생2 : 와 좋아요 ! 저 걷는 거 좋아해요*학생1 : 그럼 우리 한한하자*학생2 : 날씨도 좋은데 너무 좋아요 ~!!', 
                wordId: const Uuid().v4(),
              );
            },
            
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          // DevTextField(
          //   wordTextEditingController: _wordTextEditingController,
          //   categoryTextEditingController: _categoryTextEditingController,
          //   meaningTextEditingController: _meaningTextEditingController,
          //   subMeaningTextEditingController: _subMeaningTextEditingController,
          //   usesTextEditingController: _usesTextEditingController,
          //   searchTextEditingController: _searchTextEditingController,
          // ),
          const CategorySelectButtonList(),
          SingleChildScrollView(
            child: DictionaryView(
              isDevMode: true,
              textEditingController: _searchTextEditingController,
            ),
          ),
        ],
      ),
    );
  }
}

class DevTextField extends StatefulWidget {
  const DevTextField({
    Key? key,
    required this.wordTextEditingController,
    required this.categoryTextEditingController,
    required this.meaningTextEditingController,
    required this.subMeaningTextEditingController,
    required this.usesTextEditingController,
    required this.searchTextEditingController,
  }) : super(key: key);

  final TextEditingController wordTextEditingController;
  final TextEditingController categoryTextEditingController;
  final TextEditingController meaningTextEditingController;
  final TextEditingController subMeaningTextEditingController;
  final TextEditingController usesTextEditingController;
  final TextEditingController searchTextEditingController;

  @override
  State<DevTextField> createState() => _DevTextFieldState();
}

class _DevTextFieldState extends State<DevTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            TextField(
              controller: widget.searchTextEditingController,
              decoration: const InputDecoration(hintText: '검색'),
            ),
            TextField(
              controller: widget.wordTextEditingController,
              decoration: const InputDecoration(hintText: '단어'),
            ),
            TextField(
              controller: widget.categoryTextEditingController,
              decoration: const InputDecoration(hintText: '카테고리'),
            ),
            TextField(
              controller: widget.meaningTextEditingController,
              decoration: const InputDecoration(hintText: '의미'),
            ),
            TextField(
              controller: widget.subMeaningTextEditingController,
              decoration: const InputDecoration(hintText: '의미 설명'),
            ),
            TextField(
              controller: widget.usesTextEditingController,
              decoration: const InputDecoration(hintText: '사용 예시'),
            ),
          ],
        ),
      
    );
  }
}
