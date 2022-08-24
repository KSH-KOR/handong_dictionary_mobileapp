import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hdict/enums/dictionary_category.dart';
import 'package:hdict/services/cloud/models/cloud_dictionary.dart';
import 'package:hdict/services/cloud/constants/cloud_storage_constants.dart';
import 'package:hdict/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudDictionaryStorage {
  final dictionaries = FirebaseFirestore.instance.collection('dictionary');

  Future<void> deleteDictionary({required String documentId}) async {
    try {
      await dictionaries.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteDictionaryException();
    }
  }

  Future<void> updateDictionary({
    required String documentId,
    String? word,
    String? category,
    String? meaning,
    String? subMeaning,
    String? uses,
  }) async {
    try {
      DocumentSnapshot snapshot = await dictionaries.doc(documentId).get();
      Map<String, dynamic> dictionary = snapshot.data() as Map<String, dynamic>;
      await dictionaries.doc(documentId).update({
        wordFieldName: word ?? dictionary[wordFieldName],
        categoryFieldName: category ?? dictionary[categoryFieldName],
        meaningFieldName: meaning ?? dictionary[meaningFieldName],
        subMeaningFieldName: subMeaning ?? dictionary[subMeaningFieldName],
        usesFieldName: uses ?? dictionary[usesFieldName],
      });
    } catch (e) {
      throw CouldNotUpdateDictionaryException();
    }
  }

  Stream<Iterable<CloudDictionary>> allDictionaries() {
    final allNotes = dictionaries.where(wordIdFieldName).snapshots().map(
        (event) => event.docs.map((doc) => CloudDictionary.fromSnapshot(doc)));
    return allNotes;
  }

  Future<CloudDictionary> createNewDictionary({
    required String word,
    required String category,
    required String meaning,
    String? subMeaning,
    String? uses,
    required String wordId,
  }) async {
    final document = await dictionaries.add({
      wordFieldName: word,
      categoryFieldName: category,
      meaningFieldName: meaning,
      subMeaningFieldName: subMeaning,
      usesFieldName: uses,
      wordIdFieldName: wordId,
    });
    final fetchedDictionary = await document.get();
    return CloudDictionary(
      documentId: fetchedDictionary.id,
      word: word,
      category: category,
      meaning: meaning,
      subMeaning: subMeaning ?? '',
      uses: uses ?? '',
      wordId: wordId,
    );
  }

  Future<int> get length async =>
      await dictionaries.where(wordIdFieldName).snapshots().length;

  Stream<Iterable<CloudDictionary>> specificCategoryDictionaries(
      DictionaryCategory myCategory) {
    switch (myCategory) {
      case DictionaryCategory.total:
        return allDictionaries();

      default:
        return allDictionaries().map(
          (dictionaryList) => dictionaryList.where((dictionary) =>
              dictionary.category == convertEnumToString(myCategory)),
        );
    }
  }

  Stream<Iterable<CloudDictionary>> contains(String keyword) {
    return allDictionaries().map(
          (dictionaryList) => dictionaryList.where((dictionary) =>
              dictionary.word.contains(keyword),)
        );
  }

  static final FirebaseCloudDictionaryStorage _shared =
      FirebaseCloudDictionaryStorage._sharedInstance();
  FirebaseCloudDictionaryStorage._sharedInstance();
  factory FirebaseCloudDictionaryStorage() => _shared;
}
