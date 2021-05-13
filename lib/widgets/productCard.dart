import 'package:flutter/material.dart';
import 'package:hope/Model/ProductlistAll.dart';
import 'package:hope/widgets/productDetail.dart';

class ProductCard extends StatefulWidget {
  GetProductListAll product;
  String token;
  String uuid;

  ProductCard({this.product,this.token,this.uuid});
  
  @override
  Product_CardState createState() => Product_CardState();
}

class Product_CardState extends State<ProductCard> {
   String imgpath = 'https://jerboa.in/usrfiles/';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                productId: widget.product.prdId,
                token:widget.token,
                uuid:widget.uuid,
                productName: widget.product.prdName,
              ),
            ),
          );
        },
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width * 0.33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(imgpath+widget.product.prdImage),
                          fit: BoxFit.cover),
                    )),
                Text(widget.product.prdName,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            )),
      ),
    );
  }
}
