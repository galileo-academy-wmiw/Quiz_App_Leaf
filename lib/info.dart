import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("About This App", style: lib.headingText, textScaleFactor: 2,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("This app is a quiz app. your scores are stored in our beautiful database, and the person who gets the most answers right wins exactly one nothing. you can only play once though, so do your best to win absolutely nothing",
                style: lib.baseText,
                textScaleFactor: 1.25,
              ),
            )
          ],

        ),
      ),
    );
  }
}
