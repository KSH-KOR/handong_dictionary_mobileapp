import 'package:flutter/material.dart';
import 'package:hdict/services/cloud/firebase_cloud_quizbook_storage.dart';
import 'package:hdict/services/cloud/models/question_model.dart';
import 'package:hdict/services/quiz_page_provider.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../services/quiz_select_provider.dart';
import '../step_progress_indicator.dart';
import 'answer_list_card.dart';
import 'bottom_button.dart';

typedef QestionCallback = void Function(Question question);

class QuizPageContents extends StatelessWidget {
  const QuizPageContents({
    Key? key,
    required this.question,
    required this.progressIndicator,
  }) : super(key: key);

  final Question question;
  final CustomizedStepProgressIndicator progressIndicator;

  @override
  Widget build(BuildContext context) {
    Provider.of<QuizSelectProvider>(context, listen: false).answer =
        question.correctAnswer;
    return FutureBuilder(
      future: FirebaseCloudQuizStorage().fetchAnswers(question: question),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(46),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "'${question.question}'은",
                          style: AppTextStyles.title4,
                        ),
                        const Text(
                          "무엇을 의미할까요?",
                          style: AppTextStyles.title4,
                        ),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(46),
                SizedBox(
                  width: 300,
                  child: progressIndicator,
                ),
                addVerticalSpace(66),
                Expanded(
                    child: AnswerListCard(
                  answers: question.answers,
                )),
                const BottomButton(),
                addVerticalSpace(88),
              ],
            );
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
