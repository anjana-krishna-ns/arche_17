import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Cart/cart_screen.dart';
import '../Wish_list/wishPage.dart';
class Banner1 extends StatefulWidget {
  const Banner1({Key? key}) : super(key: key);

  @override
  State<Banner1> createState() => _Banner1State();
}

class _Banner1State extends State<Banner1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arche'),
        backgroundColor: Colors.black,
        actions:[ IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Wish()));
            },
            icon:  Icon(Icons.favorite)),Padding(padding: EdgeInsets.all(5)),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
              },
              icon:  Icon(Icons.shopping_cart_rounded)),],


      ),
      body: SafeArea(
        child:
        ListView(
          children: [ Column(
    children: [
      CarouselSlider(
              items:[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/ban1.png')
                      )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/ban2.png')
                      )
                  ),
                )
              ],
              options:CarouselOptions(
                enlargeCenterPage:true,
                autoPlay:true,
                autoPlayCurve:Curves.fastOutSlowIn,
                enableInfiniteScroll:true,
                autoPlayAnimationDuration:Duration(milliseconds: 2000),
                viewportFraction:0.8,
              ),
          ),
      Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ex5.2.png'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            height: 100,
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
      ]),
        ]),
    ));
  }
}
