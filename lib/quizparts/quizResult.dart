import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;

class QuizResult extends StatelessWidget {
  final int score;

  const QuizResult(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 60,
          child: Center(
            child: Text(
              "Your Score:",
              style: lib.headingText,
            ),
          ),
        ),
        Center(
          child: Text(
            score.toString(),
            style: lib.headingText,
            textScaleFactor: 7,
          ),
        ),
        Center(
          child: Text(
            "of ${lib.questions.length} questions",
            style: lib.headingText,
            textScaleFactor: 1.2,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20 ),
          child: ElevatedButton(
            child: const Text(
              'Try Again?',
              style: lib.baseText,
              textScaleFactor: 1.2,
            ),
            onPressed: (){
              lib.restartQuiz.add(true);
            },
          ),
        )
      ],
    );
  }
}
