

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hdict/services/cloud/constants/cloud_storage_constants.dart';

@immutable
class CloudDictionary{
  final String documentId;
  final String word;
  final String category;
  final String meaning;
  final String subMeaning;
  final String uses;
  final String wordId;

  const CloudDictionary({
    required this.documentId,
    required this.word,
    required this.category,
    required this.meaning,
    required this.subMeaning,
    required this.uses,
    required this.wordId,
});

  CloudDictionary.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) : 
    documentId = snapshot.id,
    word = snapshot.data()[wordFieldName],
    category = snapshot.data()[categoryFieldName],
    meaning  = snapshot.data()[meaningFieldName],
    subMeaning = snapshot.data()[subMeaningFieldName],
    uses = snapshot.data()[usesFieldName],
    wordId = snapshot.data()[wordFieldName];
}


