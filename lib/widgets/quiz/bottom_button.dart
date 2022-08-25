import 'package:flutter/material.dart';
import 'package:hdict/theme/text_theme.dart';
import '../../enums/quiz_status.dart';
import '../../services/quiz_state_service.dart';
import '../../theme/app_colors.dart';
import '../../utilities/helper_widgets.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({
    Key? key,
  }) : super(key: key);

  

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {

  late final _quizService;

  @override
  void initState() {
    _quizService = QuizService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QuizStatus quizStatus = _quizService.getQuizStatus(context);
    return SizedBox(
      width: 154,
      height: 48,
      child: TextButton(
        onPressed: () => _quizService.getFunction(quizStatus, context),
        style: TextButton.styleFrom(
          backgroundColor: _quizService.getColor(quizStatus),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _quizService.getText(quizStatus),
              style: AppTextStyles.buttonText.copyWith(color: AppColors.whiteColor),
            ),
            addHorizontalSpace(4),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}


