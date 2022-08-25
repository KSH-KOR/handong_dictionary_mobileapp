import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/widgets/buttons/navigate_to_home.dart';
import 'package:hdict/widgets/my_appbar.dart';
import '../../widgets/quiz/bottom_button.dart';

class QuizStartView extends StatelessWidget {
  const QuizStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const MyAppBar(leadingButton: NavigateToHomePageButton()),
      body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(61, 231, 61, 0),
                child: Text(
                  '퀴즈를 시작하시겠습니까?',
                  style: AppTextStyles.title2.copyWith(color: AppColors.mainTextColor),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(110.5, 300, 110.5, 0),
                child: BottomButton(),
              ),
            ],
          ),
    );
  }
}
