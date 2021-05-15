import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope/Screens/homePage.dart';
import 'package:hope/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
     WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
    .then((_) {
    String log = preferences.getString('logged');
                            runApp(MyApp(login: log,));
}
    );}

class MyApp extends StatefulWidget {
  String login;
  MyApp({this.login});
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hope Point',
      theme: ThemeData(),
      home: widget.login == 'true'? HomePage():LoginPage(),
    );
  }
}
