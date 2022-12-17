import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../screens/Cart/cart_screen.dart';
import '../screens/Home_page/detailPage/detail_2.dart';
import '../screens/Home_page/grid.dart';
import '../screens/Wish_list/wishPage.dart';

class Banner2 extends StatefulWidget {
  const Banner2({Key? key}) : super(key: key);

  @override
  State<Banner2> createState() => _Banner2State();
}

class _Banner2State extends State<Banner2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Arche'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Wish()));
                },
                icon: Icon(Icons.favorite)),
            Padding(padding: EdgeInsets.all(5)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartPage()));
                },
                icon: Icon(Icons.shopping_cart_rounded)),
          ],
        ),
        body: SafeArea(
          child: ListView(children: [
            Column(children: [
              CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/ban1.png'))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/ban2.png'))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/ban1.png'))),
                  ),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  viewportFraction: 0.8,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ex5.2.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => GriD()));
                      },
                    ),
                    Text(('Sneakers'),style:TextStyle(backgroundColor: Colors.white), ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/ex5.2.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                  ),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/org6.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/org6.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ]),
        ));
  }
}
