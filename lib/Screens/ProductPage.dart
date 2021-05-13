import 'package:flutter/material.dart';
import 'package:hope/Model/ProductlistAll.dart';
import 'package:hope/services/apiService.dart';
import 'package:hope/widgets/productCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class ProductMain extends StatefulWidget {
  @override
  _ProductMainState createState() => _ProductMainState();
}

class _ProductMainState extends State<ProductMain> {
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                Text('  Fashion & Clothing',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            fashion(),
            Row(
              children: [
                Text('  Footwears',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            footwears(),
            Row(
              children: [
                Text('  Cosmetics & Bodycare',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            cosmetics(),
            Row(
              children: [
                Text('  Pappa Roti',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            pappaRoti(),
          ]),
        ),
      ),
    );
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
                        return ProductCard(product: productlistall[index]);
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

  Widget fashion() {
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
                        return ProductCard(product: productlistall[index]);
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

  Widget footwears() {
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
                        return ProductCard(product: productlistall[index]);
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

  Widget cosmetics() {
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
                        return ProductCard(product: productlistall[index]);
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

  Widget pappaRoti() {
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
                        return ProductCard(product: productlistall[index]);
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
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
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
    );
  }
}
