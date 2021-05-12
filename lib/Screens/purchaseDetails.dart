import 'package:flutter/material.dart';

class PurchaseDetails extends StatefulWidget {
  int item;
  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Purchase Details',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:10),
                    child: Text('2 Items',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              Center(
                child: Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('23 February 2021,3:00 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Items',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                Text('Price',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                           Padding(
                              padding: const EdgeInsets.symmetric(vertical:5.0,horizontal:8),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Item Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Text('200 TSh',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ],
                          ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical:5.0,horizontal:8),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Item Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Text('200 TSh',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ],
                          ),
                           ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Center(
                child: Material(
                  elevation: 5,
                  shadowColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                       
                                Row(
                                  children: [
                                    Text('Total: 400 TSh',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Hope Point : 30 ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                            Text('(25% discount)',style: TextStyle(
                                            fontSize: 15,color: Colors.green,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                Divider(thickness: 2,color:  Color(0xffE58714)),
                                Row(
                                  children: [
                                    Text('Total Payable 350 TSh',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                             
                             
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
