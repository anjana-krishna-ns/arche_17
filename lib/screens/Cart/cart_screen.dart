import 'package:flutter/material.dart';

import '../Home_page/detailPage/detail_page1.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(onPressed: () {
            }, child: Text('Buy Now'))

              // InkWell(
              //   onTap: () {
              //   },
              //   child:Text('Buy Now')
              // ),
          ],
        ),
      ),
    );
  }
}