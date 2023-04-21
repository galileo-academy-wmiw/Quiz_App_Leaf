import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;

class AnswerButton extends StatefulWidget {
  AnswerButton(this.answer, this.isCorrect, this.processAnswer);

  final bool isCorrect;
  final String answer;
  final Function processAnswer;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Color?> colorAnimation, borderAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    colorAnimation = ColorTween(begin: Colors.blue[100]).animate(animationController);
    borderAnimation = ColorTween(begin: Colors.blue).animate(animationController);
    colorAnimation.addListener(() {setState(() {});});
    colorAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        widget.processAnswer;
        animationController.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.5 - lib.textMargin * 2;
    return Padding(
        padding: const EdgeInsets.all(lib.textMargin),
      child: GestureDetector(
        onTap: (){
          Color endColor;
          if(widget.isCorrect){
            endColor = Colors.green;
          }else{
            endColor = Colors.red;
          }
          colorAnimation = ColorTween(begin: Colors.blue[100], end: endColor).animate(animationController);
          borderAnimation = ColorTween(begin: Colors.blue, end: endColor).animate(animationController);
          animationController.forward();
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: buttonWidth * 0.5,
            minWidth: buttonWidth,
            maxWidth: buttonWidth,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorAnimation.value,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1.0,
                )
              ],
              border: Border.all(
                color: borderAnimation.value ?? Colors.black, //color couldn't be null, if borderAnimation.value is null it's now black because that'll still look good even if the animation decides to go missing
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
      ),
    );
  }
}
