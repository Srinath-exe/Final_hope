import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hope/Model/WalletModel.dart';
import 'package:hope/Screens/Purchases.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/cupon.dart';
import 'package:hope/widgets/purchaseRedeem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'package:toggle_switch/toggle_switch.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<bool> isSelected = [true, false];
  bool i;
  int type = 0;
  String token = '';
  String uuid = '';
  String imgpath = 'https://jerboa.in/usrfiles/';
  ApiService apiService;
  void gettokenAndUuid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokentemp = preferences.getString('token');
    String uuidtemp = preferences.getString('uuid');
    String login = preferences.getString('logged');
    apiService = new ApiService(token: token);
    print(login);

    setState(() {
      token = tokentemp;
      uuid = uuidtemp;
    });
  }

  @override
  void initState() {
    gettokenAndUuid();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    apiService = new ApiService(token: token);
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
                      textScaleFactor: 1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          balanceCard(),
          referBanner(),
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
                        child: Text(
                          'Recent Purchases',
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Purchases()));
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'View All',
                                textScaleFactor: 1,
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
                PurchaseWallet()
              ]))
        ],
      )),
    );
  }

  Widget balanceCard() {
    return FutureBuilder(
        future: apiService.getWallet(uuid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            GetWalletDetail getWalletDetail = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 2,
                shadowColor: Colors.grey[100],
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.15 * 0.65,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text(
                                          'Total TSh Balance',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        '${getWalletDetail.amount}TSh',
                                        textScaleFactor: 1,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Material(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.toll,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Text(
                                          'Total Points',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        '${getWalletDetail.points}',
                                        textScaleFactor: 1,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.14 * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View More",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 2,
                shadowColor: Colors.grey[100],
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.15 * 0.65,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text(
                                          'Total TSh Balance',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Row(
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[100],
                                            highlightColor: Colors.white,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Material(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.toll,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Text(
                                          'Total Points',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[100],
                                            highlightColor: Colors.white,
                                            child: Container(
                                              color: Colors.grey,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.14 * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View More",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            );
          }
        });
  }

  Widget referBanner() {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: Color(0xffF2D4C9),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.9 * 0.7,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(3),
                      width: MediaQuery.of(context).size.width * 0.95 * 0.7,
                      child: Row(
                        children: [
                          Text(
                            'Refer and Earn FREE Points',
                            style: TextStyle(
                                color: Colors.pink[500],
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(3),
                      width: MediaQuery.of(context).size.width * 0.95 * 0.7,
                      child: Row(
                        children: [
                          Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.9 * 0.6,
                              child: Text(
                                  'Earn 50 TSh worth of free Points by inviting your friends to join Hope Point',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal))),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.95 * 0.3,
              decoration: BoxDecoration(
                color: Colors.transparent,
                //  image: DecorationImage(
                //                       image: AssetImage(
                //                         'assets/images/gift1.png',
                //                       ),
                //                       fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Stack(children: [
                  Opacity(
                      child: Image.asset('assets/images/gift1.png',
                          scale: 2, fit: BoxFit.contain, color: Colors.black),
                      opacity: 0.5),
                  ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Image.asset('assets/images/gift1.png')))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget balance(String amount, String points) {
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
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
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
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('$points',
                          textScaleFactor: 1,
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
