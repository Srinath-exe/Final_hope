import 'package:flutter/material.dart';
import 'package:hope/Model/PurchaseSelectAll.dart';
import 'package:hope/Screens/CuponsPage.dart';
import 'package:hope/services/apiService.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseDetails extends StatefulWidget {
  GetPurchasesSelectAll getPurchasesSelectAll;
  PurchaseDetails({this.getPurchasesSelectAll});
  int item;
  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  ApiService apiService;

  String token = '';
  String uuid = '';
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
    String date = Jiffy(widget.getPurchasesSelectAll.prcStrtdate).yMMMMd;
    apiService = new ApiService(token: token);
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
        body: FutureBuilder(
            future: apiService.getPurchasesSelectAll(uuid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<GetPurchasesSelectAll> purchasesSelectAll = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 0),
                            child: Text('Purchase Id',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text('${widget.getPurchasesSelectAll.prcId}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      Center(
                        child: Material(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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
                                        Text('$date',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${widget.getPurchasesSelectAll.strName}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Purchase Price',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                            "${widget.getPurchasesSelectAll.prcAmountpaid}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Points Spent',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                            widget.getPurchasesSelectAll
                                                .prcPointspent,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            widget.getPurchasesSelectAll
                                                        .prcCoupon ==
                                                    ''
                                                ? "No Coupan Used"
                                                : "${widget.getPurchasesSelectAll.prcCoupon}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CuponsPage()));
                                          },
                                          child: Row(
                                            children: [
                                              Text('View Coupons',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Color(0xffE58714))),
                                              Icon(Icons.keyboard_arrow_right,color: Color(0xffE58714))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      Center(
                        child: Material(
                          elevation: 5,
                          shadowColor: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          'Total: ${widget.getPurchasesSelectAll.prcAmountpaid} TSh',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          'Points : ${widget.getPurchasesSelectAll.prcPointspent} ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w400)),
                                     
                                    ],
                                  ),
                                  Divider(
                                      thickness: 2, color: Color(0xffE58714)),
                                  Row(
                                    children: [
                                      // Text('Total Payable 350 TSh',
                                      //     style: TextStyle(
                                      //         fontSize: 20,
                                      //         fontWeight: FontWeight.w600)),
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
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
