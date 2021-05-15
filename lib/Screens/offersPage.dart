import 'package:flutter/material.dart';
import 'package:hope/Model/OffersList.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/offerCardsvert.dart';
import 'package:hope/widgets/offersCard.dart';
import 'package:hope/widgets/productCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
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

  String imgpath = "https://jerboa.in/usrfiles/";
  @override
  Widget build(BuildContext context) {
    apiService = new ApiService(token: token);
    print('token : $token');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Text('  Offers',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
              ],
            ),
            offers(),
            Row(
              children: [
                Text('  Top Offers',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            fas(),
            topDeals(),
          ]),
        ),
      ),
    );
  }

  Widget offers() {
    return FutureBuilder(
      future: apiService.offerslist(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GetOffersList> offerList = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerList.length,
                itemBuilder: (context, index) {
                  return OffersCard(
                    offerList: offerList[index],
                  );
                }),
          );
        } else {
          return nilloffers(); 
        }
      },
    );
  }

  Widget topDeals() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            //  ProductCard(
            //   product: 'Product name',
            //   image: 'http://www.hopeholding.co.tz/img/bv/14.jpg',
            //   price: 25.00,
            //   productdetails:
            //       'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',
            // ),
            // ProductCard(
            //     product: 'Product Tile',
            //     image: 'http://www.hopeholding.co.tz/img/rt/fc/27.jpg',
            //   price: 25.00,
            //   productdetails:
            //       'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            // ProductCard(
            //     product: 'Product Tile',
            //     image: 'http://www.hopeholding.co.tz/img/rt/fw/5.jpg',
            //   price: 25.00,
            //   productdetails:
            //       'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            // ProductCard(
            //     product: 'Product Tile',
            //     image: 'http://www.hopeholding.co.tz/img/rt/fc/25.jpg',
            //   price: 25.00,
            //   productdetails:
            //       'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            // ProductCard(
            //     product: 'Product Tile',
            //     image: 'http://www.hopeholding.co.tz/img/pr/pr1.png',
            //   price: 25.00,
            //   productdetails:
            //       'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
          ],
        ));
  }

  Widget fas() {
    return FutureBuilder(
      future: apiService.offerslist(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GetOffersList> offerList = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerList.length,
                itemBuilder: (context, index) {
                  return OffersCardvert(
                    offerList: offerList[index],
                  );
                }),
          );
        } else {
          return nullOffer(); //TODO:
        }
      },
    );
  }

  Widget nullOffer() {
    return Container(
      child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        emptyOffercard(),
    
      ])),
    );
  }

  Widget emptyOffercard() {
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
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.grey[100],
            ),
          )),
    );
  }
  nilloffers(){
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        emptyOfferscard(),
          emptyOfferscard(),
  emptyOfferscard(),    
      ])),
    );
  }
  emptyOfferscard(){
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
                 height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width * 0.40,
              color: Colors.grey[100],
            ),
          )
          ),
    );
  }
}
