library lib;
import 'package:flutter/material.dart';

const double textMargin = 10.0;
const TextStyle baseText = TextStyle(fontSize: 16);
const TextStyle headingText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

List<dynamic> questions = [
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