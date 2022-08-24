import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/cloud_storage_constants.dart';

class Question {
  final String documentId;
  final String question;
  final String correctAnswer;
  final List<String> answers;
  final String questionId;

  Question({
    required this.documentId,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.questionId,
  });


  Question.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        question = snapshot.data()[questionFieldName] as String,
        correctAnswer = snapshot.data()[correctAnswerFieldName] as String,
        questionId = snapshot.data()[questionFieldName] as String,
        answers = [];
}

