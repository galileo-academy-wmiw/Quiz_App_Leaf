library lib;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/firebase_options.dart';
import 'dart:async';
import 'dart:core';

const double textMargin = 10.0;
const TextStyle baseText = TextStyle(fontSize: 16);
const TextStyle headingText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

List<dynamic> questions = [];
List<String> questionImages = [];
DateTime timeToFinish = DateTime(0, 0, 0);

var db = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;


void initFireBase() async{
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  setQuestionsFromDB();
}

void setQuestionsFromDB() async{
  await db.collection('questions').get().then((event){
    //load stuff
    for(var doc in event.docs){
      print("${doc.id} => ${doc.data()}");
      questions.add(doc.data());
    }

  });

  await db.collection('timeToFinishAt').get().then((event) {
    Timestamp timestamp;
    for(var doc in event.docs){
      print("${doc.id} => ${doc.data()}");
      timestamp = doc.data()['time'];
      timeToFinish = new DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
      print(timeToFinish);
    }

  });

  //load images from url
  for(int i = 0; i < questions.length; i++){
    var ref = firebaseStorage.ref().child(questions[i]["image"]);
    String url = await ref.getDownloadURL();
    print(url);
    questionImages.add(url);
  }
}
late UserCredential credential;
StreamController<bool> restartQuiz = StreamController<bool>.broadcast();
