
import 'package:flutter/material.dart';
import 'package:moony_nav_bar/moony_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_all/banner.dart';
import '../Cart/cart_screen.dart';
import '../profile_page/profile_1.dart';
import 'home.dart';
class Navbar1 extends StatefulWidget {
  const Navbar1({Key? key}) : super(key: key);

  @override
  State<Navbar1> createState() => _Navbar1State();
}
class _Navbar1State extends State<Navbar1> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }
  Widget _screen1 = HomePage();
  Widget _screen2 = Banner2();
  Widget _screen3 = My_profile();
  Widget _screen4 = CartPage();
  int selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false ,
      child: MaterialApp(
        home: Scaffold(
          body: getBody(),
          bottomNavigationBar: MoonyNavigationBar(
            items: <NavigationBarItem>[
              NavigationBarItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(0);
                  }),
              NavigationBarItem(
                  icon: Icons.category_outlined,
                  activeIcon: Icons.category,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(1);
                  }),

              NavigationBarItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(2);
                  }),
              NavigationBarItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(3);
                  }),
            ],
            style: MoonyNavStyle(
             //
              indicatorPosition: IndicatorPosition.TOP,
              indicatorType: IndicatorType.POINT,
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._screen1;
    } else if (this.selectedIndex == 1) {
      return this._screen2;
    } else if (this.selectedIndex == 2) {
      return this._screen3;
    }
    return this._screen4;
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
