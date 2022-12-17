import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../banner.dart';
class LOG extends StatefulWidget {
  const LOG({Key? key}) : super(key: key);

  @override
  State<LOG> createState() => _LOGState();
}

class _LOGState extends State<LOG> {
  final _formkey = GlobalKey<FormState>();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Banner2()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white24,
                      ),
                      child: TextFormField(
                        controller: username_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(5),
                            hintText: "phone",
                            hintStyle: TextStyle(color: Colors.black),
                            icon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            )),
                        validator: (valuephone) {
                          if (valuephone!.isEmpty) {
                            return 'Enter  number';
                          }
                          if (valuephone.length < 10) {
                            return 'Number minimum length is 10';
                          }
                          if (valuephone.length > 13) {
                            return 'The number must be 10 digit';
                          }
                          if (RegExp(r'^[0-9]+$').hasMatch(valuephone)) {
                            return null;
                          } else {
                            return 'Numbers only';
                          }
                        },
                        onSaved: (value1) {
                          //phone = value1!;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      child: TextFormField(
                        controller: password_controller,
                        keyboardType: TextInputType.visiblePassword,
                        //  obscureText: _visible,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  //   show();
                                },
                                child: Icon(Icons.remove_red_eye_outlined)),
                            hintStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: "Confirm password",
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.black,
                            )),
                        validator: (valuepassword) {
                          if (valuepassword!.isEmpty) {
                            return 'Enter your password';
                          }
                          if (valuepassword.length < 6) {
                            return 'Password must be more than 6 Letters';
                          }
                          if (valuepassword.length > 12) {
                            return 'Password must not be more than 12 Letters';
                          }
                          if (RegExp(
                              r'^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$')
                              .hasMatch(valuepassword)) {
                            return null;
                            //  writedData();
                          } else {
                            return "Password should Contain at least 1 symbol,Uppercase or number";
                          }
                        },
                        //   onSaved: (value1){
                        //   pass = value1!;
                        // },
                      ),
                    ),
                    SizedBox(),
                    Container(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: StadiumBorder()),
                          onPressed: () {
                            String username = username_controller.text;
                            String password = password_controller.text;
                            if (username != '' && password != '') {
                              print('Successfull');
                              logindata.setBool('login', false);
                              logindata.setString('username', username);
                              if (_formkey.currentState!.validate()) {
                                //    writedData();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Banner2()));
                              }
                            }
                          },
                          child: Text("LOG IN")),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}