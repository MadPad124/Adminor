import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget showText(String text,double fontSize,Color textColor,FontWeight fontWeight){

  return Text(text , style: TextStyle(fontWeight: fontWeight,fontSize: fontSize,color: textColor,fontFamily: 'vazir'),);

}

Widget adminorLoadingText(int speed,double fontSize,Color textColor){
  return Center(
    child: AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText('ADMiNOR',
            textStyle: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.bold),
            speed: Duration(milliseconds: speed)),
      ],
      repeatForever: true,
    ),
  );
}