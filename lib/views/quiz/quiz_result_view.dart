import 'package:flutter/material.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/theme/ui_parameters.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:hdict/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

import '../../services/quiz_page_provider.dart';
import '../../services/quiz_select_provider.dart';
import '../../theme/app_colors.dart';
import '../../widgets/quiz/bottom_button.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correctCount = Provider.of<QuizSelectProvider>(context, listen: false).correctCount;
    int totalCount = Provider.of<QuizPageProvider>(context, listen: false).totalPageCount!;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: UIParameters.getWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(147),
              const Text('퀴즈 결과', style: AppTextStyles.title4,),
              addVerticalSpace(147),
              Text('$correctCount/$totalCount 문제를 맞추셨군요.', style: AppTextStyles.body10,),
              addVerticalSpace(395),
              const BottomButton(),
            ],
          ),
        ),
      ),
    );
  }
}