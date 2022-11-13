import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function answerQuestion;
  final List<Map<String, Object>> questions;

  const Quiz(
      {Key? key,
      required this.questionIndex,
      required this.answerQuestion,
      required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question: questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(
            selectAnswer: () => answerQuestion(answer['score'] as int),
            answerText: answer['text'] as String,
            score: answer['score'] as int,
          );
        }).toList(),
      ],
    );
  }
}
