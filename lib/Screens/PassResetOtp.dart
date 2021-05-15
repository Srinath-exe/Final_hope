import 'package:flutter/material.dart';
import 'package:hope/Model/ForgotPassword.dart';
import 'package:hope/Screens/NewPassowrd.dart';


import 'package:otp_screen/otp_screen.dart';

class VerificatioPagePass extends StatefulWidget {
  String otp;
 ResponseForgotPassword responseForgotPassword;
  VerificatioPagePass({this.otp,this.responseForgotPassword});
  @override
  _VerificatioPagePassState createState() => _VerificatioPagePassState();
}

class _VerificatioPagePassState extends State<VerificatioPagePass> {
  @override
  Widget build(BuildContext context) {
    return OtpScreen(
      otpLength: 6,
      icon: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/otplogo.png'),
                fit: BoxFit.contain)),
      ),
      validateOtp: validateOtp,
      routeCallback: moveToNextScreen,
      title: "Verification",
      subTitle: "Enter the code sent to phone",
      titleColor: Colors.black,
      themeColor: Color(0xffE58714),
    );
  }

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 500));
    if (otp == widget.otp) {
      return null;
    } else {
      return "OTP does not Match";
    }
  }

  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewPassword(
          responseForgotPassword: widget.responseForgotPassword,

        )));
    
  }
}
