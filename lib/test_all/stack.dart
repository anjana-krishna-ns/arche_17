import 'package:flutter/material.dart';
class Stack1 extends StatefulWidget {
  const Stack1({Key? key}) : super(key: key);

  @override
  State<Stack1> createState() => _Stack1State();
}

class _Stack1State extends State<Stack1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SafeArea(
        child:   Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 51, 204, 255), width: 1),
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
              ),
            ),
            Positioned(
                left: 50,
                top: 12,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  color: Colors.white,
                  child: Text(
                    'Create an account',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                )),
          ],
        )

      )

    );
  }
}
