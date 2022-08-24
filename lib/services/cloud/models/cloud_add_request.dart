

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hdict/services/cloud/constants/cloud_storage_constants.dart';
import 'package:uuid/uuid.dart';

@immutable
class CloudAddRequest{
  final String documentId;
  final String word;
  final String meaning;
  final String requestId;

  const CloudAddRequest({
    required this.documentId,
    required this.word,
    required this.meaning,
    required this.requestId,
});

  CloudAddRequest.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) : 
    documentId = snapshot.id,
    word = snapshot.data()[wordFieldName],
    meaning  = snapshot.data()[meaningFieldName],
    requestId  =  snapshot.data()[wordFieldName];
}


