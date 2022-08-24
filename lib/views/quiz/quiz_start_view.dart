import 'package:flutter/material.dart';
import 'package:hdict/constants/routes.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:hdict/widgets/buttons/navigate_to_home.dart';
import 'package:hdict/widgets/my_appbar.dart';

class QuizStartView extends StatelessWidget {
  const QuizStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(leadingButton: NavigateToHomePageButton()),
      body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(61, 231, 61, 0),
                child: Text(
                  '퀴즈를 시작하시겠습니까?',
                  style: TextStyle(
                    fontFamily: 'PretendardVariable',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 21),
                child: Text(
                  "총 10문제가 출제됩니다.",
                  style: TextStyle(
                    fontFamily: 'PretendardVariable',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(110.5, 300, 110.5, 0),
                child: SizedBox(
                  width: 154,
                  height: 48,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, quizPlayRoute, (route) => false);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: const BorderSide(
                            width: 0,
                            color: AppColors.primaryColor,
                          )),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: <Widget>[
                              addHorizontalSpace(10),
                              Text(
                                '시작하기',
                                style: AppTextStyles.buttonText
                                    .copyWith(color: AppColors.whiteColor),
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
