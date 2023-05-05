import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/library.dart' as lib;
import 'package:quiz_app/main.dart';

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
                    }else if(e.code == "invalid-email"){
                      print("invalid email");
                    }else if(e.code == "user-disabled"){
                      print("this user is disabled");
                    }else if(e.code == "user-not-found"){
                      print("this user doesn't exist");
                    }else{
                      print(e.code);
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
    );
  }
}