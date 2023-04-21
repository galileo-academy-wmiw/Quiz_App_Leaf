import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;

class AnswerButton extends StatefulWidget {
  AnswerButton(this.answer, this.isCorrect);

  final bool isCorrect;
  final String answer;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.5 - lib.textMargin * 2;
    return Padding(
        padding: const EdgeInsets.all(lib.textMargin),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: buttonWidth * 0.5,
          minWidth: buttonWidth,
          maxWidth: buttonWidth,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 1.0,
              )
            ],
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              widget.answer,
              textAlign: TextAlign.center,
              style: lib.baseText,
            ),
          ),
        ),
      ),
    );
  }
}
