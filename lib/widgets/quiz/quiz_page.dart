
import 'package:flutter/src/widgets/framework.dart';
import 'package:hdict/services/cloud/models/question_model.dart';
import 'package:hdict/widgets/quiz/quiz_page_contents.dart';
import 'package:provider/provider.dart';

import '../../services/quiz_page_provider.dart';
import '../step_progress_indicator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.allQuestions}) : super(key: key);

  final Iterable<Question> allQuestions;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    Provider.of<QuizPageProvider>(context).totalPageCount = widget.allQuestions.length;
    return QuizPageContents(
      question: widget.allQuestions.elementAt(Provider.of<QuizPageProvider>(context).currentIndex),
      progressIndicator: CustomizedStepProgressIndicator(
        currentStep: Provider.of<QuizPageProvider>(context).currentIndex + 1,
        totalSteps: widget.allQuestions.length,
      ),
    );
  }
}
