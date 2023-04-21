import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;

import 'answerbutton.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: lib.textMargin),
              child: Text(
                "question 1 of 5",
                style: lib.baseText,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: lib.textMargin),
              child: Text(
                "score: 10",
                style: lib.baseText,
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.asset('assets/images/vraag01.png', fit: BoxFit.fitWidth,),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(minHeight: 50),
          child: Container(
            child: Text('what is your favorite color'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnswerButton(),
            AnswerButton(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnswerButton(),
            AnswerButton(),
          ],
        )
      ],
    );
  }
}
