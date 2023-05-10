import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:quiz_app/library.dart' as lib;

class AlreadySentScreen extends StatelessWidget {
  const AlreadySentScreen({Key? key}) : super(key: key);

  Color randomizeGhostColor()
  {
    var rng = Random();
    int randomColorInt = rng.nextInt(7);

    if(randomColorInt == 0){
      return Colors.red;
    }else if(randomColorInt ==1){
      return Colors.orange;
    }else if(randomColorInt == 2){
      return Colors.yellow;
    }else if(randomColorInt == 3){
      return Colors.green;
    }else if(randomColorInt == 4){
      return Colors.blue;
    }else if(randomColorInt == 5){
      return Colors.purple;
    }else if(randomColorInt == 6){
      return Colors.pink;
    }else{
      return Colors.black; //fallback ghost color
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Color ghostColor = randomizeGhostColor();

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.ghost, size: (screenWidth/6)*5, color: ghostColor,),
          SizedBox(
            width: (screenWidth/6)*5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("sorry", style: lib.headingText, textScaleFactor: 4, ),
                Text("This spooky ghost won't allow you to send in a quiz twice.", style: lib.baseText, textScaleFactor: 1.25,),
                Text("No worries tho, there's always next time",style: lib.baseText, textScaleFactor: 1.25,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
