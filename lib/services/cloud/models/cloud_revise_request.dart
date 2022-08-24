

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hdict/services/cloud/constants/cloud_storage_constants.dart';

@immutable
class CloudReviseRequest{
  final String documentId;
  final String word;
  final String revisement;
  final String requestId;

  const CloudReviseRequest({
    required this.documentId,
    required this.word,
    required this.revisement,
    required this.requestId,
});

  CloudReviseRequest.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) : 
    documentId = snapshot.id,
    word = snapshot.data()[wordFieldName],
    revisement  = snapshot.data()[revisementFieldName],
    requestId  =  snapshot.data()[wordFieldName];
}


