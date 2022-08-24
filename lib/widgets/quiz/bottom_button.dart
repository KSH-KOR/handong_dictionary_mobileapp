import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../services/quiz_page_provider.dart';
import '../../services/quiz_select_provider.dart';
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

  void actionsAfterSubmitted(BuildContext context) {
    final pageProvider = Provider.of<QuizPageProvider>(context, listen: false);
    final selectProvider =
        Provider.of<QuizSelectProvider>(context, listen: false);
    
    selectProvider.isSubmitted = false;
    selectProvider.isSelectable = true;
    selectProvider.currentIndex = null;

    if (pageProvider.currentIndex <
        pageProvider.totalPageCount! - 1) {
          pageProvider.nextQuiz();
    } else{
      pageProvider.isFinished = true;
      Navigator.of(context).pushNamedAndRemoveUntil(quizResultRoute, (route) => false);
    }
  }

  void actionsBeforeSubmitted(BuildContext context) {
    final selectProvider =
        Provider.of<QuizSelectProvider>(context, listen: false);
    if (selectProvider.currentIndex != null) {
      selectProvider.isSubmitted = true;
      selectProvider.isSelectable = false;
    }
  }

  void actionsAfterFinished(BuildContext context){
    final selectProvider =
        Provider.of<QuizSelectProvider>(context, listen: false);
    final pageProvider = Provider.of<QuizPageProvider>(context, listen: false);
    selectProvider.correctCount = 0;
    selectProvider.isSubmitted = false;
    selectProvider.isSelectable = true;
    selectProvider.currentIndex = null;

    pageProvider.currentIndex = 0;
    pageProvider.isFinished = false;
    pageProvider.totalPageCount = null;
    Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 154,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          Provider.of<QuizPageProvider>(context, listen: false).isFinished ? actionsAfterFinished(context) :
          Provider.of<QuizSelectProvider>(context, listen: false).isSubmitted
              ? actionsAfterSubmitted(context)
              : actionsBeforeSubmitted(context);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              Provider.of<QuizPageProvider>(context, listen: false).isFinished ? AppColors.primaryColor :
              Provider.of<QuizSelectProvider>(context).currentIndex != null
                  ? const Color(0xff000000)
                  : const Color(0xffD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Provider.of<QuizPageProvider>(context, listen: false).isFinished ? '메인으로' :
              Provider.of<QuizSelectProvider>(context).isSubmitted
                  ? '다음으로'
                  : '결과보기',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'PretendardVariable',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
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