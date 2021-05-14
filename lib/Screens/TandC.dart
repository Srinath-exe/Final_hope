import 'package:flutter/material.dart';

class TnC extends StatefulWidget {
  @override
  _TnCState createState() => _TnCState();
}

class _TnCState extends State<TnC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '-Spend 100,000 & above and get 30,000 discount  \n on purchase.', style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-For further communcation on promtion and \n registration of loyality program,provide your \n personal details.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Voucher cannot be redeemed or exchanged \n for cash.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Voucher must be presented at the Cash Counter \n at the time of purchase.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Voucher must be presented at the Cash Counter \n at the time of purchase.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Voucher is not Transferable or Partially \n redeemable.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Only one voucher per transaction.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Voucher is valid on only regular price iteams \n (not on discounted merchandise ).',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '-Any dispute should be reffered to the Company \n and the decision of the Company shall be final.',style: TextStyle(
                              fontSize: 15,)
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
