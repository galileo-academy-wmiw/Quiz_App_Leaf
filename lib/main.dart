import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/library.dart' as lib;

import 'authenticationScreen.dart';
import 'info.dart';
import 'quiz.dart';
import 'welcome.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  lib.initFireBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:Colors.blue),
      home: SelectLoginOrRegisterScreen(),
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(title: Text('Flutter Quiz'),
          ),
          bottomNavigationBar: TabBar(
            indicatorColor: Colors.blueAccent,
            labelColor: Colors.blueAccent,
            tabs: [
              Tab(icon:Icon(Icons.home), text: 'Welcome'),
              Tab(icon:Icon(Icons.live_help), text: 'QUIZ!'),
              Tab(icon:Icon(Icons.info), text: 'about this app')
            ],
          ),
          body: TabBarView(
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


