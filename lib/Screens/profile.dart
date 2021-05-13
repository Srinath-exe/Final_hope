import 'package:flutter/material.dart';
import 'package:hope/Model/profile_model.dart';
import 'package:hope/Screens/CuponsPage.dart';
import 'package:hope/Screens/TandC.dart';
import 'package:hope/Screens/login.dart';
import 'package:hope/Screens/notificationPage.dart';
import 'package:hope/Screens/referralPage.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/cupon.dart';
import 'package:hope/Screens/storesPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String token = '';
  String uuid = '';
  String imgpath = 'https://jerboa.in/usrfiles/';
  ApiService apiService;

  String adm = '';
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
    print('uuid: $uuid');
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text('Profile', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          children: [
            FutureBuilder(
                future: apiService.getProfile(uuid),
                builder: (context, snapshot) {
                  print('snap : ${snapshot.data}');
                  if (snapshot.hasData) {

                    ProfileModel profile = snapshot.data;
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('${profile.admFname} ${profile.admLname}',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text('${profile.admMobile}',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ));
                  } else {
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height:100,
                                            width:100,
                                            color: Colors.black
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[100],
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[100],
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ));
                  }
                }),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.green[100];
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_activity, color: Colors.green),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            'Coupons',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.green[600],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black)
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CuponsPage()));
                    });
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.pink[100];
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.store_mall_directory,
                              color: Colors.pink[500]),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            'Stores',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.pink[800],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black)
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stores()));
                    });
                  }),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.yellow[100];
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.notifications, color: Colors.yellow[700]),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.yellow[800],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black)
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()));
                    });
                  }),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.blue[100];
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.connect_without_contact,
                              color: Colors.blue[700]),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            'Referral',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[800],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black)
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReferralPage()));
                    });
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.grey[100];
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.receipt, color: Colors.black),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20, color: Colors.black)
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TnC()));
                    });
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.red[100];
                        return Colors.white;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.red[800],
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.logout, size: 20, color: Colors.redAccent),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  }),
            ),
            // ListTile(
            //   title: Text("Ntotify"),
            //   trailing: Icon(Icons.notifications),
            //   onTap: () {}
            // )
          ],
        ))));
  }
}
