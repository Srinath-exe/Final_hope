import 'package:flutter/material.dart';
import 'package:hope/Screens/homePage.dart';
import 'package:hope/Screens/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: 30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                  
                    children: [
                      Positioned(
                        left: 180,
                        top: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 80,
                           decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.orange[800],
                                  Colors.orange[500],
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -40,
                        bottom: 7,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.10,
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.orange[100],
                                  Colors.orange[100],
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: -120,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.5,
                       
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.08),
                              Text('Hello,        ',
                                  style: TextStyle(fontSize: 25)),
                              Text('    Login!',
                                  style: TextStyle(fontSize: 50)),
                            ],
                          ),
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.orange[400],
                                  Colors.orange[300],
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                        ),
                      ),
                    ],
                  )),
              Column(children: [
                //image
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset('assets/images/hopelogo.png')),
                      Text("P O I N T",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Column(children: [
                      Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.phone_android_outlined,color:  Color(0xffE58714)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        )),
                                        hintText: 'Phone Number'),
                                    onTap: () {
                                      _controller.animateTo(
                                        _controller.position.maxScrollExtent,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline,color:  Color(0xffE58714)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        )),
                                        hintText: 'Password'),
                                    obscureText: true,
                                    onTap: () {
                                      _controller.animateTo(
                                        _controller.position.maxScrollExtent,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.transparent))),
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.pressed))
                                                return Colors.orange[200];
                                              return Colors.orange[500];
                                            },
                                          ),
                                        ),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          });
                                        }),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Don\'t have an account?',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400)),
                                              GestureDetector( 
                                                onTap: () {
                                                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                                                },
                                                child: Text('Sign Up!',
                                          style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600, color:  Color(0xffE58714))
                                                ),
                                               
                                              ),
                                                                                ],
                                  ),
                                ),
                              ]))
                    ]))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
