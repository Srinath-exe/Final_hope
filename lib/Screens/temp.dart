import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
   bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text('Notifications', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
             Container(
               color: Color(0xff81BFCA),
               height: MediaQuery.of(context).size.height*0.22,
               width: MediaQuery.of(context).size.width,
               child: Image.asset('assets/images/notificationimg.jpg'),
             ),
            notify(' info','Invite a friend to get 10 TSH off on your \nnext purchase'),
             notify(' info','Red Tags new product is available now, \nfind out the nearest red tag store'),
         
             notify(' info','Invite a friend to get 10 TSH off on your \nnext purchase'), 
                notify(' info','Redeem your cupon for flat 20% off'),
             notify(' info','Invite a friend to get 10 TSH off on your \nnext purchase'),
             notify(' info','Invite a friend to get 10 TSH off on your \nnext purchase'),
             notify(' info','Red Tags new product is available now, \nfind out the nearest red tag store'),
         
             notify(' info','Invite a friend to get 10 TSH off on your \nnext purchase'), 
                notify(' info','Redeem your cupon for flat 20% off'),
             notify(' info','Invite a friend to get 10 TSH off on your \nnext purchase'),
              
            ],)
          )
        )
    );
  }
  Widget notify(String icon,String content){
    return 
       Container(
       
        height: MediaQuery.of(context).size.height *0.08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(border: Border.all(  color: Color(0xff81BFCA),width:0.1),),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.info, color: Color(0xff81BFCA),),
              ),
              Text( content, style: TextStyle(
                          fontSize: 17,
                         
                          color: Colors.black,
                        ),),
            ],
          )
        ]),);
    
  }
}