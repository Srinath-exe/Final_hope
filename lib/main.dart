import 'package:flutter/material.dart';
import 'package:hope/login.dart';
import 'package:splash_screen_view/ColorizeAnimatedText.dart';
import 'package:splash_screen_view/ScaleAnimatedText.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splash_screen_view/TyperAnimatedText.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hope Point',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenView(
      home: LoginPage(),
      duration: 500,
      imageSize: 100,
      imageSrc: "assets/images/hopelogoremovebg.png",
      text: "P O I N T",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: Colors.white,
    )
    );
  }
}

