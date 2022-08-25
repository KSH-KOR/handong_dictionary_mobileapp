import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/widgets/my_appbar.dart';

import '../../services/cloud/firebase_cloud_quizbook_storage.dart';
import '../../services/cloud/models/question_model.dart';
import '../../widgets/buttons/navigate_to_home.dart';
import '../../widgets/quiz/quiz_page.dart';

class QuizPlayView extends StatefulWidget {
  const QuizPlayView({Key? key}) : super(key: key);

  @override
  State<QuizPlayView> createState() => _QuizPlayViewState();
}

class _QuizPlayViewState extends State<QuizPlayView> {
  late final FirebaseCloudQuizStorage _quizService;

  @override
  void initState() {
    _quizService = FirebaseCloudQuizStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const MyAppBar(leadingButton: NavigateToHomePageButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: StreamBuilder(
          stream: _quizService.allQuestions(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                if (snapshot.hasData) {
                  final allQuestions = snapshot.data as Iterable<Question>;
                  return QuizPage(
                    allQuestions: allQuestions,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
