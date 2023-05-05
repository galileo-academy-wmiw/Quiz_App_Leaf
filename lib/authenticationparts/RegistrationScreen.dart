import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/authenticationparts/LoginScreen.dart';
import 'package:quiz_app/library.dart' as lib;


class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  final userNameTextFieldController = TextEditingController();
  final passWordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: userNameTextFieldController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username"
                )
              ),
              TextField(
                controller: passWordTextFieldController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password"
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
                      }else if(e.code == "invalid-email"){
                        print("email address is invalid");
                      }else if(e.code == "operation-not-allowed"){
                        print("operation isn't allowed");
                      }else if(e.code == "weak-password"){
                        print("this password isn't secure");
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
    );
  }
}