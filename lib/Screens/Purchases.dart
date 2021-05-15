import 'package:flutter/material.dart';
import 'package:hope/widgets/purchaseRedeem.dart';

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text(
            'Purchases History',
            style: TextStyle(
       
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body:  SingleChildScrollView(
                  child: Container(
                    
                    child: SingleChildScrollView(
                      child: Column(children: [PurchaseWallet()]),
                    ),
                  ),
        )

    );
  }
}