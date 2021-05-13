import 'package:flutter/material.dart';
import 'package:hope/Model/CuponList.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/cuponcard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class CuponsPage extends StatefulWidget {
  @override
  _CuponsPageState createState() => _CuponsPageState();
}

class _CuponsPageState extends State<CuponsPage> {
  String token = '';
  String uuid = '';
  String imgpath = 'https://jerboa.in/usrfiles/';
  ApiService apiService;
  void gettokenAndUuid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokentemp = preferences.getString('token');
    String uuidtemp = preferences.getString('uuid');
    String login = preferences.getString('logged');
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
            FutureBuilder(
                future: apiService.couponlist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<GetCouponList> couponList = snapshot.data;
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: couponList.length,
                          itemBuilder: (context, index) {
                            return CuponRedeem(
                                coupon: couponList[index],
                                token: token,
                                uuid: uuid);
                          }),
                    );
                  } else {
                    return nullCoupon();
                  }
                }),
          ],
        ))));
  }

  Widget nullCoupon() {
    return Container(
      child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        emptycuponcard(),
        emptycuponcard(),
        emptycuponcard(),
      ])),
    );
  }

  Widget emptycuponcard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[100],
            highlightColor: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.20,
              color: Colors.grey[100],
            ),
          )),
    );
  }
}
