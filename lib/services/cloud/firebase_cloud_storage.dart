import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hdict/enums/dictionary_category.dart';
import 'package:hdict/services/cloud/cloud_dictionary.dart';
import 'package:hdict/services/cloud/cloud_storage_constants.dart';
import 'package:hdict/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudStorage {
  final dictionaries = FirebaseFirestore.instance.collection('dictionary');

  Future<void> deleteNote({required String documentId}) async {
    try {
      await dictionaries.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteDictionaryException();
    }
  }

  Future<void> updateDictionary({
    required String documentId,
    required String word,
    required String category,
    required String meaning,
    required String subMeaning,
    required String uses,
  }) async {
    try {
      await dictionaries.doc(documentId).update({
        wordFieldName: word,
        categoryFieldName: category,
        meaningFieldName: meaning,
        subMeaningFieldName: subMeaning,
        usesFieldName: uses,
      });
    } catch (e) {
      throw CouldNotUpdateDictionaryException();
    }
  }

  Stream<Iterable<CloudDictionary>> allDictionaries() {
    final allNotes = dictionaries
        .where(wordIdFieldName)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => CloudDictionary.fromSnapshot(doc)));
    return allNotes;
  }

  Future<CloudDictionary> createNewNote({
    required String word,
    required String category,
    required String meaning,
    required String subMeaning,
    required String uses,
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
      subMeaning: subMeaning,
      uses: uses,
      wordId: wordId,
    );
  }

  Future<int> get length async => await dictionaries.where(wordIdFieldName).snapshots().length;

  Stream<Iterable<CloudDictionary>> specificCategoryDictionaries(DictionaryCategory myCategory) {
    return allDictionaries().map(
      (dictionaryList) => dictionaryList.where((dictionary) => dictionary.category == convertEnumToString(myCategory)),
    );
  }

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;
}
