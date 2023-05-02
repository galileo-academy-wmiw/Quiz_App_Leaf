import 'package:flutter/material.dart';
import 'package:quiz_app/library.dart' as lib;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username"
                )
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password"
              ),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text("Register"),
            )
          ],
        ),
      ),
    );;
  }
}