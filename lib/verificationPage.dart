import 'package:flutter/material.dart';
import 'package:hope/referral.dart';

import 'package:otp_screen/otp_screen.dart';

class VerificatioPage extends StatefulWidget {
  @override
  _VerificatioPageState createState() => _VerificatioPageState();
}

class _VerificatioPageState extends State<VerificatioPage> {
  @override
  Widget build(BuildContext context) {
 
                 return OtpScreen(
                   otpLength: 4,
                   icon: Container(
                   
                     decoration:BoxDecoration(
                       image:DecorationImage(
                         image:AssetImage('assets/images/otplogo.png'),fit: BoxFit.contain
                       )
                     ),
                   ),
                   validateOtp: validateOtp,
                    routeCallback: moveToNextScreen,
                     title: "Verification",
          subTitle: "Enter the code sent to phone",
                      titleColor: Colors.black,
        themeColor: Color(0xffE58714),);
}
 Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 500));
    if (otp == "1234") {
      return null;
     
    } else {
      return null;
      
    }
   
  }
void moveToNextScreen(context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => Referral()));
  }
}
