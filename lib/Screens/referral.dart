import 'package:flutter/material.dart';
import 'package:hope/Model/register_model.dart';
import 'package:hope/Screens/homePage.dart';
import 'package:hope/Screens/login.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/progressHUD.dart';

import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Referral extends StatefulWidget {
  PostRegister registermodel;
  Referral({this.registermodel});
  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  ScrollController _controller;
  ApiService apiService;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = new ApiService();
    apiService = new ApiService();
    _controller = ScrollController(initialScrollOffset: 15);
    super.initState();
  }

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
          child: Container(
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/referral.png',
                                ),
                                fit: BoxFit.contain))),
                  )),
              Container(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Got a referral code?',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                ),
                Text('Enter your referral code ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                Text('and get upto 1000 points',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.registermodel.admRefferedBy = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[50],
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[500], width: 2),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          )),
                      hintText: 'Referral Code',
                      suffixIcon: Container(
                        height: MediaQuery.of(context).size.height * 0.060,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          color: Colors.transparent))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.orange[200];
                                  return Colors.orange[500];
                                },
                              ),
                            ),
                            onPressed: () {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                              setState(() {
                                isApiCallProcess = true;
                              });
                              // apiService
                              //     .signUp(widget.registermodel)
                              //     .then((value) async {
                              //   print(postRegisterToJson(widget.registermodel));
                              //   if (value.error == false) {
                              //     setState(() {
                              //       isApiCallProcess = false;
                              //     });
                              //     SharedPreferences preferences =
                              //         await SharedPreferences.getInstance();
                              //     preferences.setString('logged', 'true');
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => HomePage()));
                              //   }
                              // });
                            },
                            child: Text(
                              'Redeem',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.orange))),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.orange[200];
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isApiCallProcess = true;
                      });
                      widget.registermodel.admRefferedBy = null;
                      apiService
                          .signUp(widget.registermodel)
                          .then((value) async {
                        if (value.error == false) {
                          setState(() {
                            isApiCallProcess = false;
                          });
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setString('logged', 'true');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      });
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text('Invite your friends and get',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                Text('bonus points!',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                Text('invite your friends with the code ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                Text('and get exciting bonus points',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.orange))),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.orange[200];
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                      Share.share('http://www.hopeholding.co.tz/');
                    },
                    child: Text(
                      'Invite',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ]))
            ]),
          ),
        ));
  }
}
