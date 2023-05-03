import 'package:flutter/material.dart';
import 'package:quiz_app/authenticationparts/AuthFunctions.dart';
import 'dart:async';
import 'package:quiz_app/library.dart' as lib;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final userNameTextFieldController = TextEditingController();
  final passWordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: userNameTextFieldController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username"
                  )
              ),
              TextField(
                controller: passWordTextFieldController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  signInUser(
                  userNameTextFieldController.text,
                  passWordTextFieldController.text);

                  //now we wait a few seconds for user to sign in #JANKYASBALLS

                },
                child: Text("Log In"),
              )
            ],
          ),
        ),
      ),
    );;
  }
}