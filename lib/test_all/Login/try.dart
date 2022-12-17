import 'package:flutter/material.dart';

class gogo extends StatefulWidget {
  const gogo({Key? key}) : super(key: key);

  @override
  State<gogo> createState() => _gogoState();
}

class _gogoState extends State<gogo> {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        body: Column(
          children: [
            Container(
              height: 56.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage("assets/images/org6.png"), fit: BoxFit.cover),
              ),
              child: ElevatedButton(
                child: Row( //declared a row
                  children: <Widget>[
                    SizedBox(width: 16.0,),
                    Image.asset(
                        "assets/images/org7.png", height: 200, width: 200),
                    //icon image
                    SizedBox(width: 20.0,),
                    Text( //heading text
                      'Random Videos',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                onPressed: () {
                  // print('button pressed');
                  // Navigator.pop(context); //button action call back
                },
              ),
              padding: EdgeInsets.all(300),

            ),Container(
              height: 56.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage("assets/images/org1.png"), fit: BoxFit.cover),
              ),
              child: ElevatedButton(
                child: Row( //declared a row
                  children: <Widget>[
                    SizedBox(width: 16.0,),
                    Image.asset(
                        "assets/images/org2.png", height: 200, width: 200),
                    //icon image
                    SizedBox(width: 20.0,),
                    Text( //heading text
                      'Random Videos',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                onPressed: () {
                  // print('button pressed');
                  // Navigator.pop(context); //button action call back
                },
              ),
              padding: EdgeInsets.all(100),

            ),
          ],
        ),
      );
  }
  }
