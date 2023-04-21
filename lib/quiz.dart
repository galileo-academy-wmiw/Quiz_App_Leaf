import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;

import 'quizparts/quizQuestion.dart';
import 'quizparts/quizResult.dart';

class Quiz extends StatefulWidget {

  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionNumber = 0;
  int score = 0;

  void processAnswer(bool isCorrect){
    if(isCorrect){
      score++;
    }
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionNumber >= lib.questions.length){
      return QuizResult();
    }else{
      return QuizQuestion(questionNumber, score, processAnswer);
    }
  }
}
