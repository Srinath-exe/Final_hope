import 'package:flutter/material.dart';
import 'package:hope/Model/register_model.dart';
import 'package:hope/Screens/NewPassowrd.dart';
import 'package:hope/Screens/referral.dart';

import 'package:otp_screen/otp_screen.dart';

class VerificatioPage extends StatefulWidget {
  String otp;
  String type;
  VerificatioPage({this.otp,this.type});
  @override
  _VerificatioPageState createState() => _VerificatioPageState();
}

class _VerificatioPageState extends State<VerificatioPage> {
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
    if(widget.type=='signup') {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Referral()));
    }else{
       Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewPassword()));
    }
  }
}
