import 'dart:async';
import 'package:flutter/material.dart';
import '../Login/firebase_reg.dart';
import '../Login/login.dart';
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    registerpage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(

          child: Column(
            children: [
              Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/icon.png'),
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Colors.black12,
              )
            ],
          )
      ),
    );
  }
}