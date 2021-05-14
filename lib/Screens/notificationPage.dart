import 'package:flutter/material.dart';
import 'package:hope/Model/NotificationUserWise.dart';
import 'package:hope/services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String token = '';
  String uuid = '';
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xff81BFCA),
            pinned: this._pinned,
            snap: this._snap,
            floating: this._floating,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Notifications",
                  style: TextStyle(color: Colors.black)),
              background: Container(
                color: Color(0xff81BFCA),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/notificationimg.jpg'),
              ),
            ),
          ),
          SliverToBoxAdapter(
              // child: SingleChildScrollView(
              child: FutureBuilder(
                  future: apiService.notificationuserwise(uuid),
                  builder: (context, snapshot) {
                    print(snapshot);
                    if (snapshot.hasData) {
                      List<GetNotificationUserWise> notificationuserwise =
                          snapshot.data;
                      return Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.70,
                        child: ListView.builder(
                            itemCount: notificationuserwise.length,
                            itemBuilder: (context, index) {
                              return notify(notificationuserwise[index]);
                            }),
                      );
                    } else {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: Center(
                            child: Container(
                              child: Text('No Notifications',style:TextStyle(
                                fontSize: 20, color: Colors.cyan[400]
                              )),
                            ),
                          ),
                        );
                      }
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }))
          //  ),
        ],
      ),
    );
  }

  Widget notify(GetNotificationUserWise getNotificationUserWise) {
    String url = 'https://jerboa.in/usrfiles/';
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff81BFCA), width: 0.1),
      ),
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info,
                    color: Color(0xff81BFCA),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(url + getNotificationUserWise.msgBnrimg),
                      Row(
                        children: [
                          Text(
                            getNotificationUserWise.msgSubject,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            getNotificationUserWise.msgMessage,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
          onPressed: () {
            setState(() {});
          }),
    );
  }
}
