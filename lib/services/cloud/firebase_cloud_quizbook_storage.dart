import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import 'constants/cloud_storage_constants.dart';
import 'models/question_model.dart';

class FirebaseCloudQuizStorage {
  final questions =
      FirebaseFirestore.instance.collection('question');

  Stream<Iterable<Question>> allQuestions() {
    final allQuizzes = questions.where(questionIdFieldName).snapshots().map(
        (event) => event.docs.map((doc) => Question.fromSnapshot(doc)));
    return allQuizzes;
  } 

  Future<void> fetchAnswers({required Question question}) async {
    final CollectionReference<Map<String, dynamic>> answersRF = FirebaseFirestore.instance.collection('question').doc(question.documentId).collection('answer');
    QuerySnapshot<Map<String, dynamic>> snapshot = await answersRF.get();
    question.answers.addAll(snapshot.docs.first.data().map((key, value) => MapEntry(key, value.toString())).values.toList());
  }

  Future<int> get length async =>
      await questions.where(questionIdFieldName).snapshots().length;

  void navigatoQuestions({
    required Question question,
    required BuildContext context,
    bool isTryAgain = false,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        quizStartRoute, arguments: question, (route) => false);
  }

  static final FirebaseCloudQuizStorage _shared =
      FirebaseCloudQuizStorage._sharedInstance();
  FirebaseCloudQuizStorage._sharedInstance();
  factory FirebaseCloudQuizStorage() => _shared;
}
