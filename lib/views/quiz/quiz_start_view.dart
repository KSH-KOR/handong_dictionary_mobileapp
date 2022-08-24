import 'package:flutter/material.dart';
import 'package:hdict/constants/routes.dart';
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
                padding: const EdgeInsets.fromLTRB(110.5, 248, 110.5, 0),
                child: SizedBox(
                  width: 154,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, quizPlayRoute, (route) => false);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xffff9119),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: const <Widget>[
                              Text(
                                '시작하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PretendardVariable',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
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