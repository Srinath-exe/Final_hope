import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hope/Model/register_model.dart';
import 'package:hope/Screens/login.dart';
import 'package:hope/Screens/verificationPage.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/progressHUD.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  @override
  SsignupState createState() => SsignupState();
}

class SsignupState extends State<Signup> {
  ScrollController _controller;
  ApiService apiService;
  PostRegister registermodel;
  bool _passwordVisible;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible = false;
    apiService = new ApiService();
    registermodel = new PostRegister();
    _controller = ScrollController(initialScrollOffset: 15);
    super.initState();
  }

  bool isApiCallProcess = false;
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
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 120,
                          top: -10,
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
                          bottom: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
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
                          left: -10,
                          top: -95,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08),
                                Text('   Welcome,        ',
                                    style: TextStyle(fontSize: 25)),
                                Text('    Sign Up!',
                                    style: TextStyle(fontSize: 20)),
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
                    height: MediaQuery.of(context).size.height * 0.16,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset('assets/images/hopelogo.png')),
                        Text("P O I N T",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),

                  Container(
                    
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        
                      ),
                     
                      // height: MediaQuery.of(context).size.height * 0.60,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                        Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height*0.62,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height *
                                  //         0.04),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            registermodel.admFname = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter First name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.account_circle,
                                                color: Color(0xffE58714)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                              const Radius.circular(25.0),
                                            )),
                                            hintText: 'First Name',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              registermodel.admLname = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter last name';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.account_circle,
                                                  color: Color(0xffE58714)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                const Radius.circular(25.0),
                                              )),
                                              hintText: 'Last Name',
                                              hintStyle:
                                                  TextStyle(fontSize: 14))),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          setState(() {
                                            registermodel.admEmail = value;
                                          });
                                        },
                                        validator: (value) {
                                          print(RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value));
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter Email';
                                          }
                                          if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return 'Please enter a valid Email';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email,
                                                color: Color(0xffE58714)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                              const Radius.circular(25.0),
                                            )),
                                            hintText: 'Email',
                                            hintStyle: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          setState(() {
                                            registermodel.admMobile = value;
                                          });
                                        },
                                        validator: validateMobile,
                                        // (value) {
                                        //   if (value == null || value.isEmpty) {
                                        //     return 'Please enter Phone No.';
                                        //   }
                                        //   if( value.length!=10){
                                        //     return 'Please enter Valid Phone No.';
                                        //   }
                                        //   return null;
                                        // },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.phone_android_outlined,
                                                color: Color(0xffE58714)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                              const Radius.circular(25.0),
                                            )),
                                            hintText: 'Phone Number',
                                                           hintStyle: TextStyle(fontSize: 14),
                                            ),
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
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            registermodel.admSecret = value;
                                          });
                                        },
                                        obscureText: _passwordVisible,
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
                                              const Radius.circular(25.0),
                                            )),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(fontSize: 14),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Color(0xffE58714)),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible =
                                                      !_passwordVisible;
                                                });
                                              },
                                            )),
                                      ),
                                    ),
                                  ),
                              
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
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
                                                            30.0),
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
                                            'Sign Up',
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
                                              registermodel.admRefferedBy =
                                                  null;
                                              apiService
                                                  .signUp(registermodel)
                                                  .then((value) async {
                                                if (value.error == false) {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  });
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
                                                              VerificatioPage(
                                                                type: 'signup',
                                                                otp: value.otp
                                                                    .toString(),
                                                              )));
                                                }
                                                if (value == null) {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  });
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType: DialogType.INFO,
                                                    animType:
                                                        AnimType.BOTTOMSLIDE,
                                                    title: 'SignUp failed',
                                                    desc:
                                                        'Account already exists with this Email/Number',
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {},
                                                  )..show();
                                                } else {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  });
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.WARNING,
                                                    animType:
                                                        AnimType.BOTTOMSLIDE,
                                                    title: 'SignUp failed',
                                                    desc:
                                                        'Account already exists with this Email/Number',
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {},
                                                  )..show();
                                                }
                                              });
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             VerificatioPage(
                                              //               registermodel:
                                              //                   registermodel,
                                              //             )));
                                            } else {}
                                          }),
                                    ),
                                  ),
                                      Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Already have an account?',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          },
                                          child: Text('Login',
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
          ),
        ),
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
