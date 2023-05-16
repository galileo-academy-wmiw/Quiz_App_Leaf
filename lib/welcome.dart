import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/authentication_screen.dart';
import 'package:quiz_app/library.dart' as lib;

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'QUIZ APP',
              style: lib.titleText,
              textScaleFactor: 2,
            ), //this generates a line. i genuinely have no clue why
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SelectLoginOrRegisterScreen()));
                },
                style: lib.authenticationScreensButtonStyle,
                child: const Text(
                  "Sign Out",
                  style: lib.buttonText,
                )),
          )
        ],
      ),
    );
  }
}
