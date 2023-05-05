import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/authenticationScreen.dart';
import 'package:quiz_app/library.dart' as lib;

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                if(Navigator.canPop(context)){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SelectLoginOrRegisterScreen()));
                }
              },
              child: const Text("Sign Out")
          )
        ],
      ),
    );
  }
}
