import 'package:flutter/material.dart';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:hope/widgets/cupon.dart';
import 'package:hope/widgets/productCard.dart';


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
  @override
  Widget build(BuildContext context) {
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
          
           
          ]),
        ),
      ),
    );
  }

  Widget cupon() {
    return Container(
        child: CuponCard(
            name: 'Jonathan Reyes',
            no: '1234 6744 1234',
            amount: '35 TSh',
            points: 800.00));
  }

  Widget carousel() {
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
                      item,
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
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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

  Widget fashion() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/22.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/23.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/24.jpg',
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
                image: 'http://www.hopeholding.co.tz/img/rt/fc/26.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/27.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/28.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/29.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/30.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/31.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/32.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/33.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/35.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/36.jpg'),
          ],
        ));
  }

  Widget footwears() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/1.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/2.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/3.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/4.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/5.jpg'),
          ],
        ));
  }

  Widget cosmetics() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/10.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/11.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/12.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/13.jpg'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/14.jpg'),
          ],
        ));
  }

  Widget pappaRoti() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr1.png'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr2.png'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr3.png'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr3.png'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr4.png'),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr5.png'),
          ],
        ));
  }
}
