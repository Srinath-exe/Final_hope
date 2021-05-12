import 'package:flutter/material.dart';
import 'package:hope/widgets/cuponcard.dart';


class CuponsPage extends StatefulWidget {
  @override
  _CuponsPageState createState() => _CuponsPageState();
}

class _CuponsPageState extends State<CuponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Redeem',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total points',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                    Text('800',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w400)),
                  ],
                )),
                 CuponRedeem(
                company: 'Bottega Vedra',
                date: '30 january 2021',
                logo: 'bv',
                col: 'purple',
                valid:false),
            CuponRedeem(
                company: 'Bottega Vedra',
                date: '30 june 2021',
                logo: 'bv',
                col: 'purple',
                valid:true),
            CuponRedeem(
                company: 'RedTag',
                date: '14 june 2021',
                logo: 'rt',
                col: 'red',
                 valid:true),
            CuponRedeem(
                company: 'skechers',
                date: '30 january 2021',
                logo: 'sk',
                col: 'green',
                 valid:true),
            CuponRedeem(
                company: 'Flormar', date: '30 january 2021', logo: 'fl', valid:true),
          ],
        ))));
  }
}
