import 'package:flutter/material.dart';

class contain extends StatefulWidget {
  const contain({Key? key}) : super(key: key);

  @override
  State<contain> createState() => _containState();
}

class _containState extends State<contain> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/review1.1.png",
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              height: 44.0 + MediaQuery
                  .of(context)
                  .padding
                  .bottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.star), onPressed: () {  },),
                  IconButton(icon: Icon(Icons.star), onPressed: () {  },),
                ],
              ),
            ),
            body: Text("Hello world"))
      ],
    );
  }}
