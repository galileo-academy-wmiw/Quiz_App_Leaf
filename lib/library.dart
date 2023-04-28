library lib;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/firebase_options.dart';
import 'dart:async';

const double textMargin = 10.0;
const TextStyle baseText = TextStyle(fontSize: 16);
const TextStyle headingText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

List<dynamic> questionsOLD = [
  {
    "question": "What is this logo?",
    "answers": ["Android Studio", "Dart", "Flutter", "Xcode"],
    "rightAnswer": 2,
    "image": "vraag01.png"
  },
  {
    "question": "Which language does flutter use?",
    "answers": ["C", "Dart", "Java", "Python"],
    "rightAnswer": 1,
    "image": "vraag02.png"
  },
  {
    "question": "What is an example of a widget",
    "answers": ["class", "Container", "const", "import"],
    "rightAnswer": 1,
    "image": "vraag03.png"
  }
];

List<dynamic> questions = [];

var db = FirebaseFirestore.instance;

void initFireBase() async{
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  setQuestionsFromDB();
}

void setQuestionsFromDB() async{
  await db.collection('questions').get().then((event){
    for(var doc in event.docs){
      print("${doc.id} => ${doc.data()}");
      questions.add(doc.data());
    }
  });

}

StreamController<bool> restartQuiz = StreamController<bool>.broadcast();
