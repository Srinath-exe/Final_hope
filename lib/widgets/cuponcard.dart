import 'package:flutter/material.dart';
import 'package:hope/Model/CouponDetails.dart';
import 'package:hope/Model/CuponList.dart';
import 'package:jiffy/jiffy.dart';

class CuponRedeem extends StatefulWidget {

GetCouponList coupon; 
  String token;
  String uuid;

  CuponRedeem({this.coupon,this.token,this.uuid});
  @override
  _CuponRedeemState createState() => _CuponRedeemState();
}

class _CuponRedeemState extends State<CuponRedeem> {

  @override
  Widget build(BuildContext context) {
  
     String date =  Jiffy(widget.coupon.cpnEnddate).yMMMMd;
     print(date);
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
                      child: Text('${widget.coupon.cpnName}',
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
              
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  width: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                    Text('Amount',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),),
                              
                            
                                
                                      Text('${widget.coupon.cpnAmount}Tsh',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400)),

                             
                              ]),
                             
                      ),
                        
                          RichText(
                            text:  TextSpan(
                           
                              style:  TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                   TextSpan(
                                    text: 'Cupon Number:\n',
                                   ),
                               
                                 TextSpan(text:'  ${widget.coupon.cpnNumber}\n',  style:  TextStyle(
                                        fontWeight: FontWeight.bold)),
                                 
                                  
                                   
                                  //    TextSpan(
                                  //   text: ' Card\ncosts ',
                                  //  ),
                                  //    TextSpan(
                                  //   text: '${widget.coupon.cpnAmount}Tsh', style:  TextStyle(
                                  //     fontSize:17,
                                  //     color: Colors.blue,
                                  //       fontWeight: FontWeight.bold)
                                   
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
                            Text(  widget.coupon.cpnStatus=='Active'?'Expires on':'Expired',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                            Text('$date',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: true==true?Colors.black:Colors.red[900],
                                    
                                    
                                    fontWeight: FontWeight.w600)),
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child:  widget.coupon.cpnStatus=='Active'? Container(
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
