import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;
import 'package:quiz_app/quizparts/already_sent_screen.dart';
import 'package:quiz_app/quizparts/out_of_time_screen.dart';

import 'quizparts/quiz_question.dart';
import 'quizparts/quiz_result.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> with AutomaticKeepAliveClientMixin {
  int questionNumber = 0;
  int score = 0;

  @override
  void initState() {
    lib.restartQuiz.stream.listen((restartQuiz) {
      setState(() {
        questionNumber = score = 0;
      });
    });
    super.initState();
  }

  void processAnswer(bool isCorrect) {
    print("processing answer");
    if (isCorrect) {
      score++;
    }
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<Object>(
        future: lib.doesUserAnswerExist(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data == true) {
              return const AlreadySentScreen();
            } else if (lib.timeToFinish.isBefore(DateTime.now())) {
              return const OutOfTimeScreen();
            } else if (questionNumber >= lib.questions.length) {
              return QuizResult(score);
            } else {
              return QuizQuestion(questionNumber, score, processAnswer);
            }
          } else {
            //just show white screen while loading
            return Container(
              color: Colors.white,
            );
          }
        });
  }

  @override
  bool get wantKeepAlive {
    return true;
  }
}
