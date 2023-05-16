import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;
import 'package:quiz_app/authentication_parts/login_screen.dart';
import 'package:quiz_app/authentication_parts/registration_screen.dart';

class SelectLoginOrRegisterScreen extends StatelessWidget {
  const SelectLoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('QUIZ APP', style: lib.titleText, textScaleFactor: 2,),
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
      ),
    );
  }
}




