import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/authentication_parts/login_screen.dart';
import 'package:quiz_app/library.dart' as lib;


class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
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
      body: Container(
        color: Colors.blue,
        child: Center(
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
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Username"
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8.0),
                  child: TextField(
                    controller: passWordTextFieldController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Password"
                    ),
                  ),
                ),
                ElevatedButton(
                  style: lib.authenticationScreensButtonStyle,
                    onPressed: () async{

                      UserCredential credential;
                      try{
                        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: userNameTextFieldController.text,
                            password: passWordTextFieldController.text
                        );
                        lib.credential = credential;
                        if(context.mounted){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        }else{
                          print('context not mounted in widget ${toStringShort()}');
                        }
                      } on FirebaseAuthException catch (e) {
                        if(e.code == "email-already-in-use"){
                          showErrorDialog("email address ${userNameTextFieldController.text} is already in use", context);
                        }else if(e.code == "invalid-email"){
                          showErrorDialog("email address is invalid", context);
                        }else if(e.code == "operation-not-allowed"){
                          showErrorDialog("operation is not allowed", context);
                        }else if(e.code == "weak-password"){
                          showErrorDialog("this password isn't secure, pick a different one", context);
                        }else{
                          showErrorDialog("we didn't write a special message for this error. here's the error code: ${e.code}", context);
                        }

                      } catch(e){
                        showErrorDialog(e.toString(), context);
                      }
                    },
                    child: const Text("Register", style: lib.buttonText,textScaleFactor: 1.5, ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}