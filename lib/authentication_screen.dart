import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;
import 'package:quiz_app/authenticationparts/login_screen.dart';
import 'package:quiz_app/authenticationparts/registration_screen.dart';

class SelectLoginOrRegisterScreen extends StatelessWidget {
  const SelectLoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('QUIZ APP', style: lib.titleText, textScaleFactor: 2,),//this generates a line. i genuinely have no clue why
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: lib.authenticationScreensButtonStyle,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text(
                  "Log in", style: lib.buttonText,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: lib.authenticationScreensButtonStyle,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                },
                child: const Text(
                  "Register", style: lib.buttonText,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}




