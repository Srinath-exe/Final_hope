import 'package:flutter/material.dart';
import 'package:hope/widgets/productCard.dart';



class ProductMain extends StatefulWidget {
  @override
  _ProductMainState createState() => _ProductMainState();
}

class _ProductMainState extends State<ProductMain> {
  @override
  Widget build(BuildContext context) {
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
                image: 'http://www.hopeholding.co.tz/img/rt/fc/33.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/35.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fc/36.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
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
                image: 'http://www.hopeholding.co.tz/img/rt/fw/1.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/2.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/3.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/4.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/rt/fw/5.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
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
                image: 'http://www.hopeholding.co.tz/img/bv/10.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/11.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/12.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/13.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/bv/14.jpg',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
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
                image: 'http://www.hopeholding.co.tz/img/pr/pr1.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr2.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr3.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr3.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr4.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
            ProductCard(
                product: 'Product Tile',
                image: 'http://www.hopeholding.co.tz/img/pr/pr5.png',
              price: 25.00,
              productdetails:
                  'When choosing a summer dress you want to find something that will keep you cool but also looking good. While each woman will have different opinions on the best summer dress, ultimately it’s up to you to choose what you’re comfortable and confident in.\n\nCare Instructions: machine \nwashColor Name: Black\nMaterial: Synthetic\nPalazzo\nMachine wash',),
          ],
        ));
  }
}
