import 'package:flutter/material.dart';
import 'package:hope/ProductPage.dart';
import 'package:hope/home.dart';
import 'package:hope/offersPage.dart';
import 'package:hope/walletPage.dart';


class Navbar extends StatefulWidget {
  int index;
  Navbar({this.index});
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    if (widget.index == 0) {
      return Home();
    }
    if (widget.index == 1) {
      return ProductMain();
    }
    if (widget.index == 2) {
      return Offers();
    }  if (widget.index == 3) {
      return WalletPage();
    }else {
      return Container();
    }
  }
}
