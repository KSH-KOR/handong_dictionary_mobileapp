import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hdict/services/cloud/constants/cloud_storage_constants.dart';
import 'package:hdict/services/cloud/cloud_storage_exceptions.dart';
import 'package:hdict/services/cloud/models/cloud_revise_request.dart';

class FirebaseCloudReviseRequestStorage {
  final reviseRequests = FirebaseFirestore.instance.collection('revise_request');

  Future<void> deleteReviseRequest({required String documentId}) async {
    try {
      await reviseRequests.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteDictionaryException();
    }
  }

  Stream<Iterable<CloudReviseRequest>> allReviseRequests() {
    final allReviseRequests = reviseRequests.where(wordIdFieldName).snapshots().map(
        (event) => event.docs.map((doc) => CloudReviseRequest.fromSnapshot(doc)));
    return allReviseRequests;
  }

  Future<CloudReviseRequest> createNewReviseRequest({
    required String word,
    required String revisement,
    required String requestId,
  }) async {
    final document = await reviseRequests.add({
      wordFieldName: word,
      revisementFieldName: revisement,
      wordIdFieldName: requestId,
    });
    final fetchedDictionary = await document.get();
    return CloudReviseRequest(
      documentId: fetchedDictionary.id,
      word: word,
      revisement: revisement,
      requestId: requestId,
    );
  }

  Future<int> get length async =>
      await reviseRequests.where(wordIdFieldName).snapshots().length;

  static final FirebaseCloudReviseRequestStorage _shared =
      FirebaseCloudReviseRequestStorage._sharedInstance();
  FirebaseCloudReviseRequestStorage._sharedInstance();
  factory FirebaseCloudReviseRequestStorage() => _shared;
}
