import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/routes.dart';
import '../enums/quiz_status.dart';
import '../theme/app_colors.dart';
import 'quiz_page_provider.dart';
import 'quiz_select_provider.dart';

class QuizService {
  static final QuizService _shared = QuizService._sharedInstance();
  QuizService._sharedInstance();
  factory QuizService() => _shared;

  void getFunction(QuizStatus status, BuildContext context) {
    void actionsAfterSubmitted(BuildContext context) {
      final pageProvider =
          Provider.of<QuizPageProvider>(context, listen: false);
      Provider.of<QuizSelectProvider>(context, listen: false).nextQuiz();

      if (pageProvider.currentIndex < pageProvider.totalPageCount! - 1) {
        pageProvider.nextQuiz();
      } else {
        pageProvider.isFinished = true;
        Navigator.of(context)
            .pushNamedAndRemoveUntil(quizResultRoute, (route) => false);
      }
    }

    void submitAnswers(BuildContext context) {
      Provider.of<QuizSelectProvider>(context, listen: false).submitAnswers();
    }

    void resetQuizzes(BuildContext context) {
      Provider.of<QuizSelectProvider>(context, listen: false).reset();
      Provider.of<QuizPageProvider>(context, listen: false).reset();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homeRoute, (route) => false);
    }

    void startQuizzes(BuildContext context) {
      Provider.of<QuizSelectProvider>(context, listen: false).start();
      Provider.of<QuizPageProvider>(context, listen: false).start();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(quizPlayRoute, (route) => false);
    }

    switch (status) {
      case QuizStatus.quizFinished:
        return resetQuizzes(context);
      case QuizStatus.quizNotStarted:
        return startQuizzes(context);
      case QuizStatus.submitted:
        return actionsAfterSubmitted(context);
      case QuizStatus.isNotSelected:
        break;
      case QuizStatus.isSelected:
        return submitAnswers(context);
    }
  }

  String getText(QuizStatus status) {
    switch (status) {
      case QuizStatus.quizNotStarted:
        return '시작하기';
      case QuizStatus.quizFinished:
        return '메인으로';
      case QuizStatus.submitted:
        return '다음으로';
      case QuizStatus.isSelected:
      case QuizStatus.isNotSelected:
        return '결과보기';
    }
  }

  Color getColor(QuizStatus status) {
    switch (status) {
      case QuizStatus.quizNotStarted:
        return AppColors.primaryColor;
      case QuizStatus.quizFinished:
        return AppColors.primaryColor;
      case QuizStatus.isNotSelected:
        return const Color(0xffD9D9D9);
      case QuizStatus.isSelected:
      case QuizStatus.submitted:
        return AppColors.mainTextColor;
    }
  }

  QuizStatus getQuizStatus(BuildContext context) {
    final quizPageProvider =
        Provider.of<QuizPageProvider>(context, listen: false);
    final quizSelectProvider = Provider.of<QuizSelectProvider>(context);
    if (!quizPageProvider.isStarted) {
      return QuizStatus.quizNotStarted;
    } else if (quizPageProvider.isFinished) {
      return QuizStatus.quizFinished;
    } else {
      if (quizSelectProvider.isSubmitted) {
        return QuizStatus.submitted;
      } else if (quizSelectProvider.currentIndex == null) {
        return QuizStatus.isNotSelected;
      } else {
        return QuizStatus.isSelected;
      }
    }
  }
}
