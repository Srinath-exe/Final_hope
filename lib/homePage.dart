import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hope/navigationb.dart';
import 'package:hope/profile.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
  String navigator = 'home';
}

class _HomePageState extends State<HomePage> {
  var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  double gap = 20;
  int index = 0;

  PageController controller = PageController();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.orange),
          title: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.14,
         
              child: Image.asset('assets/images/hopemainlogo.png')),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Color(
                        0xffE58714,
                      ),
                    )),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Navbar(index: _selectedIndex),
        bottomNavigationBar: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0, 25),
                )
              ]),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: GNav(
                  curve: Curves.bounceIn,
                  duration: Duration(milliseconds: 900),
                  tabs: [
                    GButton(
                      gap: gap,
                      icon: Icons.dashboard,
                      iconColor: Colors.orange,
                      iconActiveColor: Colors.orange,
                      text: 'Home',
                      textColor: Colors.orange,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      iconSize: 24,
                      padding: padding,
                    ),
                     GButton(
                      gap: gap,
                      icon: Icons.shopping_bag ,
                      iconColor: Colors.blue,
                      iconActiveColor: Colors.blue,
                      text: 'Products',
                      textColor: Colors.blue,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      iconSize: 24,
                      padding: padding,
                    ),
                    
                    GButton(
                      gap: gap,
                      icon: Icons.local_offer_sharp,
                      iconColor: Colors.pink,
                      iconActiveColor: Colors.pink,
                      
                      text: 'Offers',
                      textColor: Colors.pink,
                      backgroundColor: Colors.pink.withOpacity(0.2),
                      iconSize: 24,
                      padding: padding,
                    ),
                    GButton(
                      gap: gap,
                      icon: Icons.account_balance_wallet_outlined,
                      iconColor: Colors.green,
                      iconActiveColor: Colors.green,
                      duration: Duration(milliseconds: 1),
                      text: 'Wallet',
                      textColor: Colors.grey,
                      backgroundColor: Colors.green.withOpacity(0.2),
                      iconSize: 24,
                      padding: padding,
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (i) {
                    setState(() {
                      _selectedIndex = i;
                    });
                  })),
        )));
  }
}
