import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:provider/provider.dart';

import '../../enums/answer_status.dart';
import '../../services/quiz_select_provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.answer,
    required this.index,
  }) : super(key: key);

  final String answer;
  final int index;

  AnswerStatus getSelectedStatus(bool isSelected) {
    return isSelected ? AnswerStatus.answered : AnswerStatus.notanswered;
  }

  AnswerStatus getCorrectStatus(
      {required int index,
      required int selectedIndex,
      required String correctAnswer,
      required BuildContext context}) {
    if (index == selectedIndex) {
      if (answer == correctAnswer) {
        Provider.of<QuizSelectProvider>(context, listen: false).correctCount++;
        return AnswerStatus.correct;
      } else {
        return AnswerStatus.wrong;
      }
    } else {
      if (answer == correctAnswer) {
        return AnswerStatus.correct;
      }
      return AnswerStatus.notanswered;
    }
  }

  @override
  Widget build(BuildContext context) {
    final QuizSelectProvider quizSelectProvider =
        Provider.of<QuizSelectProvider>(context);
    return GestureDetector(
      onTap: quizSelectProvider.isSelectable
          ? () {
              quizSelectProvider.currentIndex = index;
            }
          : () {},
      child: Container(
        color: AppColors.whiteColor,
        child: Row(
          children: [
            addHorizontalSpace(20),
            getIconBasedOnAnswerStatus(
                answerStatus: quizSelectProvider.isSubmitted
                    ? getCorrectStatus(
                        index: index,
                        selectedIndex: quizSelectProvider.currentIndex!,
                        correctAnswer: quizSelectProvider.answer!,
                        context: context,
                      )
                    : getSelectedStatus(
                        quizSelectProvider.currentIndex == index,
                      )),
            addHorizontalSpace(36),
            Text(answer, style: AppTextStyles.body9),
          ],
        ),
      ),
    );
  }
}

Widget getIconBasedOnAnswerStatus({required AnswerStatus answerStatus}) {
  const double size = 35;
  switch (answerStatus) {
    case AnswerStatus.correct:
      return SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          'assets/image/fill_check_circle.svg',
          color: const Color(0xFF00AA25),
        ),
      );
    case AnswerStatus.wrong:
      return SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          'assets/image/circle_x.svg',
          color: const Color(0xFFCC0000),
        ),
      );
    case AnswerStatus.answered:
      return SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          'assets/image/fill_check_circle.svg',
          color: Colors.black,
        ),
      );
    case AnswerStatus.notanswered:
      return SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          'assets/image/circle.svg',
          color: Colors.black,
        ),
      );
  }
}
