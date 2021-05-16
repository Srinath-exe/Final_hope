import 'package:flutter/material.dart';
import 'package:hope/Model/profile_model.dart';
import 'package:hope/services/apiService.dart';

import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferralPage extends StatefulWidget {
  @override
  _ReferralPageState createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  String token = '';
  String uuid = '';
  String imgpath = 'https://jerboa.in/usrfiles/';
  ApiService apiService;
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Referral',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Refer a friend',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[800],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'And you can both save TSh 10',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.info, color: Colors.deepPurple, size: 25),
                          Text('  How it Works',
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 15),
                      listTile(
                          numb: "1",
                          title: "Invite Your friends",
                          subTitle: "Just Share your link"),
                      SizedBox(height: 10),
                      listTile(
                          numb: "2",
                          title: "Get Exclusive offers",
                          subTitle: "with 10TSh off "),
                      SizedBox(height: 10),
                      listTile(
                          numb: "3",
                          title: "You make Savings",
                          subTitle: "Then you get 10TSh off"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10),
                      FutureBuilder(
                          future: apiService.getProfile(uuid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                               ProfileModel profile = snapshot.data;
                            return   Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                        
                                      width:
                                          MediaQuery.of(context).size.width * 0.95,
                                      height: MediaQuery.of(context).size.height *
                                          0.055,
                                      child: TextFormField(
                                          showCursor: false,
                                        readOnly: true,
                                        initialValue:
                                            '${profile.admReffercode}',
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[50],
                                          focusColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[500],
                                                  width: 2),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(15.0),
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue[500],
                                                  width: 2),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(15.0),
                                              )),
                                          suffixIcon: Container(
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.080,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  15.0),
                                                          side: BorderSide(
                                                              color: Colors
                                                                  .transparent))),
                                                  backgroundColor:
                                                      MaterialStateProperty
                                                          .resolveWith<Color>(
                                                    (Set<MaterialState> states) {
                                                      if (states.contains(
                                                          MaterialState.pressed))
                                                        return Colors.blue[500];
                                                      return Colors.blue[600];
                                                    },
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  'Copy',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Colors.transparent))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.blue[600];
                                  return Colors.blue[600];
                                },
                              ),
                            ),
                            child: Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Share.share('${profile.admReffercode}');
                            },
                          ),
                        ),
                      ),
                  
                              ],
                            );
                            } else {
                              return Center(child: CircularProgressIndicator(),);
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget listTile({String numb, String title, String subTitle}) {
    return ListTile(
      leading: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(35))),
          elevation: 12,
          shadowColor: Colors.grey[100],
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(40),
                  color: Colors.white),
              child: Center(
                  child: Text('$numb',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w600))))),
      title: Text('$title',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      subtitle: Text('$subTitle', style: TextStyle(fontSize: 16)),
    );
  }
}
