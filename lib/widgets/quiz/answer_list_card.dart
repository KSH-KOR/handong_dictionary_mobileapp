import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'answer_card.dart';

class AnswerListCard extends StatefulWidget {
  const AnswerListCard(
      {Key? key, required this.answers, this.isSubmitted = false})
      : super(key: key);

  final List<String> answers;
  final bool isSubmitted;

  @override
  State<AnswerListCard> createState() => _AnswerListCardState();
}

class _AnswerListCardState extends State<AnswerListCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 40,
      ),
      itemCount: widget.answers.length,
      itemBuilder: (context, index) {
        return AnswerCard(
          answer: widget.answers[index],
          index: index,
        );
      },
      separatorBuilder: (context, index) => addVerticalSpace(40),
    );
  }
}
