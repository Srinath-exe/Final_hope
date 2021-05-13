import 'package:flutter/material.dart';
import 'package:hope/Screens/Purchases.dart';
import 'package:hope/widgets/cupon.dart';
import 'package:hope/widgets/purchaseRedeem.dart';

import 'package:toggle_switch/toggle_switch.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<bool> isSelected = [true, false];
  bool i;
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('   Account balance & History',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          balance('3,550 TSh', 800),

          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Container(
              padding: EdgeInsets.all(5),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                 Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Recent Purchases'),
                        ),
                      ),
                    
                    GestureDetector(
                       onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Purchases()));
                });
              },
                                          child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(color: Colors.yellow[900]),
                              ),
                              Icon(Icons.keyboard_arrow_right,
                                  color: Colors.yellow[900])
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.515,
                  child: SingleChildScrollView(
                    child: Column(children: [PurchaseRedeem(index: 5)]),
                  ),
                )
              ]))

          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Material(
          //       elevation: 5,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(15))),
          //       child: Container(
          //         height: MediaQuery.of(context).size.height * 0.05,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           color: Colors.white,
          //         ),
          //         child: ToggleSwitch(
          //           minWidth: 140.0,
          //           minHeight: 90.0,
          //           fontSize: 16.0,
          //           initialLabelIndex: type,
          //           activeBgColor: Colors.orange,
          //           activeFgColor: Colors.white,
          //           inactiveBgColor: Colors.white,
          //           inactiveFgColor: Colors.black,
          //           labels: [
          //             'Purchases',
          //             'Reedem',
          //           ],
          //           onToggle: (index) {
          //             setState(() {
          //               type = index;
          //             });
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          //  Container(
          //       height: MediaQuery.of(context).size.height * 0.604,
          //       color: Colors.transparent,
          //       child: SingleChildScrollView(child: PurchaseRedeem(index: type))),
        ],
      )),
    );
  }

  Widget balance(String amount, double points) {
    int point = points.toInt();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.blue[800],
            //      gradient: LinearGradient(
            // colors: [Colors.green[400], Colors.green[500], Colors.teal[500],Colors.teal[600], ])
            gradient: LinearGradient(
              colors: <Color>[Colors.white, Colors.white],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.account_balance_wallet_outlined),
                      ),
                    ),
                    Text('Balance',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )),
                  ],
                ),
                Container(
                   width: MediaQuery.of(context).size.width*0.35,
                  child: Row(
                    children: [
                      Text(amount,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ]),
              Container(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.toll, size: 25),
                      ),
                    ),
                    Text('Points',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('$point',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
