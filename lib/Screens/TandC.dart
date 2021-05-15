import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope/Model/tnc_mode.dart';
import 'package:hope/services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TnC extends StatefulWidget {
  @override
  _TnCState createState() => _TnCState();
}

class _TnCState extends State<TnC> {
  ApiService apiService;
  String token = '';
  String uuid = '';
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
    super.initState();
    gettokenAndUuid();
  }

  @override
  Widget build(BuildContext context) {
    apiService = new ApiService(token: token);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  // height: MediaQuery.of(context).size.height *0.,
                  child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: FutureBuilder(
                          future: apiService.getTnC(),
                          builder: (context, snapshot) {
                            List<TncElement> tncList = snapshot.data;
                            if (snapshot.hasData) {
                              return Scrollbar(
                                isAlwaysShown: true,
                                
                                child: ListView.builder(
                                  itemCount:tncList.length ,
                                  itemBuilder: (context,index){
                                    return tncElement(tncList[index],index+1);
                                  }),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),
                )
              ],
            ),
          ),
        ));
  }

  Widget tncElement(TncElement tncElement,int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Text(
                    "$index. ${tncElement.subject}",
                    style:GoogleFonts.montserrat(textStyle:TextStyle(
                        color: Color(0xffe3650b),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,),)
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006
            ),
            Text(
                '${tncElement.text}',style:GoogleFonts.raleway(textStyle:TextStyle()))
          ],
        ),
      ),
    );
  }
}
