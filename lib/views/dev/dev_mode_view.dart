import 'package:flutter/material.dart';
import 'package:hdict/services/textfield_provider.dart';
import 'package:hdict/widgets/dictionary/dictionary_view.dart';
import 'package:provider/provider.dart';
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
              await _dictionaryService.createNewDictionary(
                word: _wordTextEditingController.text,
                category: _categoryTextEditingController.text,
                meaning: _meaningTextEditingController.text,
                subMeaning: _subMeaningTextEditingController.text,
                uses: _usesTextEditingController.text,
                wordId: const Uuid().v4(),
              );

              _wordTextEditingController.clear();
              _meaningTextEditingController.clear();
              _subMeaningTextEditingController.clear();
              _usesTextEditingController.clear();
              // _dictionaryService.createNewDictionary(
              //   word: '침묵시간',
              //   category: '학교생활',
              //   meaning: '외부거주를 의미함.',
              //   subMeaning: '한동대학교의 기숙사에 거주하지않고 학교 밖에 거주한다는 것을 의미함.',
              //   uses: '학생1 : 팀플시간 금요일 저녁 11시 어떠세요 ?*학생2 : 저는 욉거라서 너무 늦게는 어려울 것 같아요 ㅠㅠ*학생1 : 아 그러시구나 !! 그럼 주말에 만나는 걸로 할까요 ?*학생2 : 네 좋아요 !! 감사합니다',
              //   wordId: const Uuid().v4(),
              // );
            },
            
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          DevTextField(
            wordTextEditingController: _wordTextEditingController,
            categoryTextEditingController: _categoryTextEditingController,
            meaningTextEditingController: _meaningTextEditingController,
            subMeaningTextEditingController: _subMeaningTextEditingController,
            usesTextEditingController: _usesTextEditingController,
            searchTextEditingController: _searchTextEditingController,
          ),
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
