import 'package:flutter/material.dart';
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
  int type =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
                  child: Container(
              child: Column(
            children: [
              Row(
                children: [
                  Text('   Hope Point',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
              Center(child: cupon()),
              balance('35 TSh', 800),
              Row(
                children: [
                  Text('    Recent',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation:5,
                    shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),

                                child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              
            ),
                    child: ToggleSwitch(
                      minWidth: 140.0,
                      minHeight: 90.0,
                      fontSize: 16.0,
                      initialLabelIndex: type,
                      activeBgColor: Colors.orange,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.black,
                      labels: ['Purchases', 'Reedem',],
                      onToggle: (index) {
                          setState(() {
                            type = index;
                          });
                      },
                    ),
                  ),
                ),
              ),
              PurchaseRedeem(index:type),
            ],
          )),
        ));
  }

  Widget cupon() {
    return Container(
        child: CuponCard(
            name: 'Jonathan Reyes',
            no: '1234 6744 1234',
            amount: '35 TSh',
            points: 800.00));
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
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text('Balance',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.w400)),
                Text(amount,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ]),
              Container(),
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text('Points',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.w400)),
                Text('$point',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
