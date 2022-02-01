import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function helper;
  final List<dynamic> questions;
  final int questionIndex;
  const Quiz(
      {required this.helper,
      required this.questions,
      required this.questionIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<dynamic>).map((answer) {
          return Answer(helper, answer);
        }).toList()
      ],
    );
  }
}
