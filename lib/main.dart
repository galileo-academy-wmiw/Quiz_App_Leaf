import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/library.dart' as lib;

import 'authenticationScreen.dart';
import 'info.dart';
import 'quiz.dart';
import 'welcome.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  lib.setQuestionsFromDB();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if(user == null){
      runApp(const MyApp(false));
    }else{
      runApp(const MyApp(true));
    }
  });

  //fallback app start
  print("you're not supposed to get here ever");
  runApp(const MyApp(false));
}

class MyApp extends StatelessWidget {
  const MyApp(this.userSignedIn,{Key? key}) : super(key: key);
  final bool userSignedIn;

  @override
  Widget build(BuildContext context) {
    if(userSignedIn){
      return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const QuizApp()
      );
    }else{
      return MaterialApp(
        theme: ThemeData(primarySwatch:Colors.blue),
        home: const SelectLoginOrRegisterScreen(),
      );
    }
  }
}


class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(title: const Text('Flutter Quiz'),
          ),
          bottomNavigationBar: const TabBar(
            indicatorColor: Colors.blueAccent,
            labelColor: Colors.blueAccent,
            tabs: [
              Tab(icon:Icon(Icons.home), text: 'Welcome'),
              Tab(icon:Icon(Icons.live_help), text: 'QUIZ!'),
              Tab(icon:Icon(Icons.info), text: 'about this app')
            ],
          ),
          body: const TabBarView(
            children: [
              Welcome(),
              Quiz(),
              Info(),
            ],
          ),
        )
    );
  }
}


