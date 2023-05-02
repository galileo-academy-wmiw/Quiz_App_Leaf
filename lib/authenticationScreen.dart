import 'package:flutter/material.dart';

import 'package:quiz_app/library.dart' as lib;
import 'package:quiz_app/authenticationparts/LoginScreen.dart';
import 'package:quiz_app/authenticationparts/RegistrationScreen.dart';

class SelectLoginOrRegisterScreen extends StatelessWidget {
  const SelectLoginOrRegisterScreen({Key? key}) : super(key: key);

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
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              "Log in"
            ),

          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
            },
            child: Text(
              "Register"
            ),
          )
        ],
      )
    );
  }
}




