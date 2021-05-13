import 'package:flutter/material.dart';
import 'package:hope/Model/register_model.dart';
import 'package:hope/Screens/verificationPage.dart';
import 'package:hope/services/apiService.dart';

class Signup extends StatefulWidget {
  @override
  SsignupState createState() => SsignupState();
}

class SsignupState extends State<Signup> {
  ScrollController _controller;
  ApiService apiService;
  PostRegister registermodel;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    apiService = new ApiService();
    registermodel = new PostRegister();
    _controller = ScrollController(initialScrollOffset: 15);
    super.initState();
  }

  Widget build(BuildContext context) {
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
                                    height: MediaQuery.of(context).size.height *
                                        0.08),
                                Text('Welcome,        ',
                                    style: TextStyle(fontSize: 25)),
                                Text('    Sign Up!',
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
                    height: MediaQuery.of(context).size.height * 0.16,
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
                      // height: MediaQuery.of(context).size.height * 0.60,
                      child: Column(children: [
                        Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height *
                                  //         0.04),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                          prefixIcon: Icon(Icons.account_circle,
                                              color: Color(0xffE58714)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                            const Radius.circular(60.0),
                                          )),
                                          hintText: 'First Name'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          registermodel.admLname = value;
                                        });
                                      },
                                       validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter last name';
                                            }
                                            return null;
                                          },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.account_circle,
                                              color: Color(0xffE58714)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                            const Radius.circular(60.0),
                                          )),
                                          hintText: 'Last Name'),
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          registermodel.admEmail = value;
                                        });
                                      },
                                       validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter Email';
                                            }
                                            return null;
                                          },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email,
                                              color: Color(0xffE58714)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                            const Radius.circular(60.0),
                                          )),
                                          hintText: 'Email'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          registermodel.admMobile = value;
                                        });
                                      },
                                       validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter Phone no.';
                                            }
                                            return null;
                                          },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                              Icons.phone_android_outlined,
                                              color: Color(0xffE58714)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                            const Radius.circular(60.0),
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
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          registermodel.admSecert = value;
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
                                            const Radius.circular(60.0),
                                          )),
                                          hintText: 'Password'),
                                      obscureText: true,
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
                                                            30.0),
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
                                            'Sign Up',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (validate()) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VerificatioPage(registermodel: registermodel,)));
                                            }
                                            else{
                                               
                                            }
                                          }),
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
