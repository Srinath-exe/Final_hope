import 'package:flutter/material.dart';

class CuponRedeem extends StatefulWidget {
  String company;
  String date;
  String logo;
  String col;
  bool valid;
  CuponRedeem({this.company, this.date, this.logo, this.col,this.valid});
  @override
  _CuponRedeemState createState() => _CuponRedeemState();
}

class _CuponRedeemState extends State<CuponRedeem> {

  @override
  Widget build(BuildContext context) {
  
      
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
      
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Discount',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9 * 0.85,
                      // height: MediaQuery.of(context).size.height * 0.12,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Image.asset(
                                  'assets/images/${widget.logo}.png')),
                          RichText(
                            text:  TextSpan(
                           
                              style:  TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                 TextSpan(text:'${widget.company}\'s',  style:  TextStyle(
                                        fontWeight: FontWeight.bold)),
                                 TextSpan(
                                    text: ' gift value',
                                   ),
                                    TextSpan(
                                    text: '\npacked',
                                   ),
                                   TextSpan(
                                    text: ' 25% off', style:  TextStyle(
                                        fontWeight: FontWeight.bold)
                                   ),
                                    TextSpan(
                                    text: ' for \nevery pack.Gift',
                                   ),
                                     TextSpan(
                                    text: ' Card\ncosts ',
                                   ),
                                     TextSpan(
                                    text: ' 200 POINTS', style:  TextStyle(
                                      fontSize:17,
                                      color: Colors.blue,
                                        fontWeight: FontWeight.bold)
                                   ),
                              ],
                            ),
                          )
                     
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width * 0.9 * 0.75,
                      

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Text(  widget.valid==true?'Expires':'Expired',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                            Text(widget.date,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: widget.valid==true?Colors.black:Colors.red[900],
                                    
                                    
                                    fontWeight: FontWeight.w600)),
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: widget.valid==true? Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(
                                                color: Colors.transparent))),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Colors.blue[200];
                                        return Colors.blue[500];
                                      },
                                    ),
                                  ),
                                  child: Text(
                                    'Redeem',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  }),
                            ): 
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.red[400];
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                       
                    },
                    child: Text(
                      'Redeemed',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
