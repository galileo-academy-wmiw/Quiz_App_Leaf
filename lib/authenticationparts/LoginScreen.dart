import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/library.dart' as lib;
import 'package:quiz_app/main.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  final userNameTextFieldController = TextEditingController();
  final passWordTextFieldController = TextEditingController();

  void showErrorDialog(String error, BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Something went wrong"),
          content: Text(error),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK')
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: (screenWidth/6)*5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8.0),
                  child: TextField(
                    controller: userNameTextFieldController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username"
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: passWordTextFieldController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password"
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    UserCredential credential;
                    try{
                      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: userNameTextFieldController.text,
                          password: passWordTextFieldController.text
                      );
                      lib.credential = credential;
                      if(context.mounted){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QuizApp()));
                      }else{
                        print('context not mounted in widget ${toStringShort()}');
                      }

                    }on FirebaseAuthException catch (e){
                      if(e.code == "wrong-password"){
                        print("wrong password");
                        showErrorDialog("wrong password", context);
                      }else if(e.code == "invalid-email"){
                        print("invalid email");
                        showErrorDialog("invalid email", context);
                      }else if(e.code == "user-disabled"){
                        print("this user is disabled");
                        showErrorDialog("this user is disabled", context);
                      }else if(e.code == "user-not-found"){
                        print("this user doesn't exist");
                        showErrorDialog("this user doesn't exist", context);
                      }else{
                        print(e.code);
                        showErrorDialog(e.code, context);
                      }

                    }catch(e){
                      print(e);
                    }
                  },
                  child: const Text("Log In"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}