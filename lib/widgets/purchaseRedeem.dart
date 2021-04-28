import 'package:flutter/material.dart';
import 'package:hope/purchaseDetails.dart';



class PurchaseRedeem extends StatefulWidget {
  int index;
  PurchaseRedeem({this.index});
  @override
  _PurchaseRedeemState createState() => _PurchaseRedeemState();
}

class _PurchaseRedeemState extends State<PurchaseRedeem> {
  @override
  Widget build(BuildContext context) {
    return widget.index == 0 ? purchase() : redeem();
  }

  Widget purchase() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.321,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(
          children: [
            purchasecard('Red Tag ', '12-02-2021', 2, -40, 300.00),
            purchasecard('Skechers', '30-02-2021', 1, -40, 450.00),
          ],
        ));
  }

  Widget redeem() {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.321,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Column(
            children: [
              redeemcard('Red Tag ', '12-02-2021', 2, 40, 300.00),
              redeemcard('Skechers', '30-02-2021', 1, 40, 450.00),
            ],
          )),
    );
  }

  Widget purchasecard(
      String pname, String date, int items, int coins, double total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        shadowColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PurchaseDetails()));
          },
          child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(pname,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text('$items items',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        Text('$date',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('$coins Points',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red[800],
                                fontWeight: FontWeight.w600)),
                        Text('Total: $total TSh',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget redeemcard(
      String pname, String date, int items, int coins, double total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        shadowColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PurchaseDetails()));
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(pname,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Text('$items items',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      Text('$date',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('+$coins Points',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green[800],
                              fontWeight: FontWeight.w600)),
                      Text('Total: $total TSh',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
