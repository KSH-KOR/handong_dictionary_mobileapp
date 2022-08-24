import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hdict/services/cloud/constants/cloud_storage_constants.dart';
import 'package:hdict/services/cloud/cloud_storage_exceptions.dart';
import 'package:hdict/services/cloud/models/cloud_add_request.dart';

class FirebaseCloudAddRequestStorage {
  final addRequests = FirebaseFirestore.instance.collection('add_request');

  Future<void> deleteAddRequest({required String documentId}) async {
    try {
      await addRequests.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteDictionaryException();
    }
  }

  Stream<Iterable<CloudAddRequest>> allAddRequests() {
    final allAllRequests = addRequests.where(wordIdFieldName).snapshots().map(
        (event) => event.docs.map((doc) => CloudAddRequest.fromSnapshot(doc)));
    return allAllRequests;
  }

  Future<CloudAddRequest> createNewAddRequest({
    required String word,
    required String meaning,
    required String requestId,
  }) async {
    final document = await addRequests.add({
      wordFieldName: word,
      meaningFieldName: meaning,
      wordIdFieldName: requestId,
    });
    final fetchedDictionary = await document.get();
    return CloudAddRequest(
      documentId: fetchedDictionary.id,
      word: word,
      meaning: meaning,
      requestId: requestId,
    );
  }

  Future<int> get length async =>
      await addRequests.where(wordIdFieldName).snapshots().length;

  static final FirebaseCloudAddRequestStorage _shared =
      FirebaseCloudAddRequestStorage._sharedInstance();
  FirebaseCloudAddRequestStorage._sharedInstance();
  factory FirebaseCloudAddRequestStorage() => _shared;
}
