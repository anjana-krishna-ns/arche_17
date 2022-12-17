import 'package:flutter/material.dart';
import 'package:slacks_test/screens/Home_page/home.dart';
import 'package:slacks_test/test_all/banner.dart';
import 'package:slacks_test/test_all/sign_inn/sign.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: contain(),
      // home: MyStatefulWidget(),
   //   home: Banner2(),
      //  home: LoginPageTest(),
       home: My_signinn(),
      // home: Stack1(),
    );
  }
}