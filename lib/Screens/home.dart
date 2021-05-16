import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:hope/Model/BrandList_model.dart';
import 'package:hope/Model/OffersList.dart';
import 'package:hope/Model/ProductlistAll.dart';
import 'package:hope/Model/WalletModel.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/cupon.dart';
import 'package:hope/widgets/nullcupon.dart';
import 'package:hope/widgets/offerCardsvert.dart';
import 'package:hope/widgets/productCard.dart';
import 'package:http/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

final List<String> imagesList = [
  'http://www.hopeholding.co.tz/img/banner/b3.jpg',
  'http://www.hopeholding.co.tz/img/banner/b8.jpg',
  'http://www.hopeholding.co.tz/img/banner/b6.jpg',
  'http://www.hopeholding.co.tz/img/banner/b2.jpg',
  'http://www.hopeholding.co.tz/img/banner/b9.png',
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _currentIndex = 0;
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Text('  Hope Point',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            Center(child: cupon()),
            Row(
              children: [
                Text('  Our Brands',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            carousel(),
            Row(
              children: [
                Text('  New Products',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            topDeals(),
             Row(
              children: [
                Text('  Top Offers',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            fas(),

          ]),
        ),
      ),
    );
  }

  Widget cupon() {
    return Container(
        child:FutureBuilder(
          future: apiService.getWallet(uuid),
          builder: (context, snapshot){
            if(snapshot.hasData){
              GetWalletDetail getWalletDetail = snapshot.data;
                return   CuponCard(
                  walletDetail:getWalletDetail ,
                );
             
            }else{
              return NullCoupon();
            }
          }
        )
    );
  }

  Widget carousel() {
    return FutureBuilder(
        future: apiService.brandlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<GetBrandList> brandList = snapshot.data;
            return Container(
                child: Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                 
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _currentIndex = index;
                      },
                    );
                  },
                ),
                items: brandList
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: EdgeInsets.only(
                            top: 1.0,
                            bottom: 1.0,
                          ),
                          elevation: 6.0,
                          shadowColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            child: Image.network(
                             imgpath+item.brdLogo,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: brandList.map((urlOfItem) {
                  int index = brandList.indexOf(urlOfItem);
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Color.fromRGBO(0, 0, 0, 0.8)
                          : Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  );
                }).toList(),
              )
            ]));
          } else {
            return Container(
                child: Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  // enlargeCenterPage: true,
                  //scrollDirection: Axis.vertical,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _currentIndex = index;
                      },
                    );
                  },
                ),
                items: imagesList
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: EdgeInsets.only(
                            top: 1.0,
                            bottom: 1.0,
                          ),
                          elevation: 6.0,
                          shadowColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            child: Image.network(
                              '',
                              fit: BoxFit.fitHeight,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imagesList.map((urlOfItem) {
                  int index = imagesList.indexOf(urlOfItem);
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Color.fromRGBO(0, 0, 0, 0.8)
                          : Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  );
                }).toList(),
              )
            ]));
          }
        });
  }

  Widget topDeals() {
    return FutureBuilder(
        future: apiService.productlistall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<GetProductListAll> productlistall = snapshot.data;
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: productlistall.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: productlistall[index],
                          token: token,
                          uuid: uuid,
                        );
                      },
                    ),
                  ),
                 ],
              ),
            );
          } else {
            return nullProduct();
          }
        });
  }

  Widget nullProduct() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            emptyProductCard(),
            emptyProductCard(),
            emptyProductCard(),
          ],
        ));
  }

  Widget emptyProductCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
         elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            
          ),
          child:
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[100],
              highlightColor: Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20 * 0.6,
                width: MediaQuery.of(context).size.width * 0.35,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Shimmer.fromColors(
              baseColor: Colors.grey[100],
              highlightColor: Colors.white,
              child: Container(
                    height: MediaQuery.of(context).size.height * 0.20 * 0.1,
                    width: MediaQuery.of(context).size.width * 0.35 * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50))),
                )
              ],
            )
          ]),
        ),
      ),
    );
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
}
