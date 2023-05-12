import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/authenticationparts/LoginScreen.dart';
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
        color: Colors.white,
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
                      labelText: "Password"
                    ),
                  ),
                ),
                ElevatedButton(
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
                          print("email address ${userNameTextFieldController.text} is already in use");
                          showErrorDialog("email adress ${userNameTextFieldController.text} is already in use", context);
                        }else if(e.code == "invalid-email"){
                          print("email address is invalid");
                          showErrorDialog("email adress is invalid", context);
                        }else if(e.code == "operation-not-allowed"){
                          print("operation isn't allowed");
                          showErrorDialog("operation is not allowed", context);
                        }else if(e.code == "weak-password"){
                          print("this password isn't secure");
                          showErrorDialog("this password isn't secure, pick a different one", context);
                        }else{
                          print("we didn't write a special message for this error. here's the error code: ${e.code}");
                        }

                      } catch(e){
                        print(e);
                      }
                    },
                    child: const Text("Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}