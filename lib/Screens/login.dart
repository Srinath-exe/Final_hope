import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hope/Model/Login_model.dart';
import 'package:hope/Screens/NewPassowrd.dart';
import 'package:hope/Screens/homePage.dart';
import 'package:hope/Screens/forgotPassword.dart';
import 'package:hope/Screens/signup.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/progressHUD.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ScrollController _controller;
  ApiService apiService;
   bool _passwordVisible1;
  PostLogin loginModel;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible1 = false;
    apiService = new ApiService();
    loginModel = new PostLogin();
    _controller = ScrollController(initialScrollOffset: 15);
    super.initState();
  }

  bool isApiCallProcess = false;
  bool isvealidated = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.4,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
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
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08),
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
                      height: MediaQuery.of(context).size.height * 0.21,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          setState(() {
                                            loginModel.email = value;
                                          });
                                        },
                                        validator: validateMobile,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.phone_android_outlined,
                                                color: Color(0xffE58714)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                              const Radius.circular(30.0),
                                            )),
                                            hintText: 'Phone Number'),
                                        onTap: () {
                                          _controller.animateTo(
                                            _controller
                                                .position.maxScrollExtent,
                                            duration: Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            loginModel.pass = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter Password';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock_outline,
                                                color: Color(0xffE58714)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                              const Radius.circular(30.0),
                                            )),
                                            hintText: 'Password',
                                            suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xffE58714)
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                        ),),
                                        obscureText: _passwordVisible1,
                                        onTap: () {
                                          _controller.animateTo(
                                            _controller
                                                .position.maxScrollExtent,
                                            duration: Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                          );
                                        },
                                      ),
                                    ),
                                    isvealidated
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPassword()));
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('Forgot Password?',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffE58714),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                                        color: Colors
                                                            .transparent))),
                                            backgroundColor:
                                                MaterialStateProperty
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
                                            if (validate()) {
                                              setState(() {
                                                isApiCallProcess = true;
                                              });
                                              apiService
                                                  .login(loginModel)
                                                  .then((value) async {
                                                if (value?.error == false) {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  });
                                                  print("logged In");
                                                  SharedPreferences
                                                      preferences =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  preferences.setString(
                                                      'logged', 'true');
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage()));
                                                }
                                                if (value == null) {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                    isvealidated = true;
                                                  });
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.WARNING,
                                                    animType:
                                                        AnimType.BOTTOMSLIDE,
                                                    title: 'Login failed',
                                                    desc:
                                                        'Invalid Username or Password',
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {},
                                                  )..show();
                                                }
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Don\'t have an account?',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Signup()));
                                            },
                                            child: Text('Sign Up!',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffE58714))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]))
                        ]))
                  ])
                ],
              ),
            )),
      ),
    );
  }

  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  bool validate() {
    if (_formKey.currentState.validate()) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Processing Data')));
      return true;
    } else {
      return false;
    }
  }

  Future<void> _showWrongDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Incorrect Credentials'),
                Text('Please check Mobile number and Password'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
