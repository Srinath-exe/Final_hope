import 'package:flutter/material.dart';
import 'package:hope/Model/BrandDetails_model.dart';
import 'package:hope/Model/productDetails.dart';

import 'package:hope/services/apiService.dart';

class ProductPage extends StatefulWidget {
  String productId;
  String productName;
  String token;
  String uuid;
  ProductPage({this.productId, this.productName, this.token, this.uuid});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ApiService apiService;
  String imgpath = 'https://jerboa.in/usrfiles/';
  @override
  void initState() {
    apiService = new ApiService(token: widget.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: apiService.productdetails(pid: widget.productId),
          builder: (context, snapshot) {
            GetProductDetails productDetail = snapshot.data;
            if (snapshot.hasData) {
              return FutureBuilder(
                  future: apiService.getbrandDetails(
                      brandId: productDetail.prdBrandid),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      GetBrandDetails brandDetail = snapshot.data;
                      return SingleChildScrollView(
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Material(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(38),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            imgpath + productDetail.prdImage),
                                        fit: BoxFit.contain),
                                  )),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Material(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(38),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: NetworkImage(imgpath +
                                                  brandDetail.brdLogo),
                                              fit: BoxFit.contain),
                                        )),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Container(
                              
                                    width: MediaQuery.of(context).size.width *
                                        0.5,
                                    child: Column(
                                      children: [
                                        Row(
                                          
                                          children: [
                                            Text(productDetail.prdName,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                       
                                          Row(
                                            children: [
                                              Text(brandDetail.brdName,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                       
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Container(
                               
                                    width: MediaQuery.of(context).size.width *0.28,
                                    child: Text('${productDetail.prdPrice} TSh',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text('${productDetail.prdPoints} ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                      Text('Points ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text('Product Description:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20.0),
                              child: Row(
                                children: [
                                  Text(productDetail.prdDetail,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ],
                        )),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
