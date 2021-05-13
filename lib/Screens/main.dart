import 'package:flutter/material.dart';
import 'package:hope/Screens/homePage.dart';
import 'package:hope/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/ColorizeAnimatedText.dart';
import 'package:splash_screen_view/ScaleAnimatedText.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splash_screen_view/TyperAnimatedText.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<String> getLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String log = preferences.getString('logged');
    return log;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hope Point',
      theme: ThemeData(),
      home: FutureBuilder(
        future: getLogin(),
        builder: (context, snapshot) {
          if (snapshot.data == 'true') {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
