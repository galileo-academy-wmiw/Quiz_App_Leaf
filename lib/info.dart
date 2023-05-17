import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/library.dart' as lib;

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.dragon,
              size: (screenWidth / 6) * 4,
              color: Colors.green,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "About This App",
                  style: lib.headingText,
                  textScaleFactor: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "The quiz dragon has cometh to ask thee to answer these questions three.... or more if we add more questions. You only get one chance though, so good luck and may the quiz gods be with you",
                    style: lib.baseText,
                    textScaleFactor: 1.25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
