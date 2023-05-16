import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/library.dart' as lib;

class OutOfTimeScreen extends StatelessWidget {
  const OutOfTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.hippo,
                size: (screenWidth / 6) * 4, //somehow this looks closer to 5/6th of the screen width, i think the math is a little borked for the hippo icon
                color: Colors.amber,
              ),
              SizedBox(
                width: (screenWidth / 6) * 5,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "sorry",
                      style: lib.headingText,
                      textScaleFactor: 4,
                    ),
                    Text(
                      "The Time Hippo has decided you're out of time...",
                      style: lib.baseText,
                      textScaleFactor: 1.25,
                    ),
                    Text(
                      "No worries tho, there's always next time",
                      style: lib.baseText,
                      textScaleFactor: 1.25,
                    ),
                  ],
                ),
              )
            ]
        )
    );
  }
}
