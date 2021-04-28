import 'package:flutter/material.dart';
import 'package:hope/widgets/offerCardsvert.dart';
import 'package:hope/widgets/offersCard.dart';
import 'package:hope/widgets/productCard.dart';


class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
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
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OffersCard(
                link: 'http://www.hopeholding.co.tz/img/promo-redtag.jpg'),
            OffersCard(
                link:
                    'http://www.hopeholding.co.tz/img/promo-bottegaverde.png'),
            OffersCard(
                link: 'http://www.hopeholding.co.tz/img/promo-skechers.jpg'),
            OffersCard(
                link: 'http://www.hopeholding.co.tz/img/promo-flormar.jpg'),
            OffersCard(link: 'http://www.hopeholding.co.tz/img/pr-offer1.png'),
            OffersCard(link: 'http://www.hopeholding.co.tz/img/pr-offer2.png'),
            OffersCard(link: 'http://www.hopeholding.co.tz/img/pr-offer3.png'),
            OffersCard(link: 'http://www.hopeholding.co.tz/img/pr-offer4.png'),
          ],
        ));
  }

  Widget topDeals() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
             ProductCard(
              product: 'Product name',
              image: 'http://www.hopeholding.co.tz/img/bv/14.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',
            ),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/27.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/5.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/25.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr1.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
          ],
        ));
  }

  Widget fas() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OffersCardvert(
                link: 'http://www.hopeholding.co.tz/img/banner/b8.jpg'),
          ],
        ));
  }
}
