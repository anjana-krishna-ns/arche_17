import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/Home_page/home.dart';

class registerpage1 extends StatefulWidget {
  @override
  _registerpage1State createState() => _registerpage1State();
}

class _registerpage1State extends State<registerpage1> {
  final _form = GlobalKey<FormState>();
  String? fname, lname, phone, email, password, confirmPassword;

  void writeData() async {
    _form.currentState?.save();
    var url = "https://arche-close-default-rtdb.firebaseio.com/" + "lol.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "fname": fname,
          "lname": lname,
          "phone": phone,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/images/app_bk.jpeg'),
        //     ),
        //   ),
        // ),
        Form(
          key: _form,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: "Enter first name"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value1) {
                    fname = value1!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: "Enter last name"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value2) {
                    lname = value2!;
                  },
                ),
                Container(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone), hintText: "Enter Phone Number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter valid number';
                    }
                    if (value!.isEmpty ||
                        !RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
                      return "Enter Valid number";
                    }
                    if (value.length < 10 || value.length > 10) {
                      return 'The number must be 10 digit';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value3) {
                    phone = value3!;
                  },
                ),
                Container(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.mail), hintText: "Enter Email"),
                  validator: (valuemail) {
                    if (valuemail!.isEmpty) {
                      return 'feild cant be empty';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                        .hasMatch(valuemail!)) {
                      return 'invalid email';
                    }
                    return null;
                  },
                  onSaved: (value4) {
                    email = value4!;
                  },
                ),
                Container(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.remove_red_eye),
                      hintText: "Enter password"),
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
                    } else {
                      return "Password should Contain at least 1 symbol,Uppercase or number";
                    }
                  },
                  onSaved: (value5) {
                    password = value5!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: "Enter Confirm Password"),
                  onSaved: (value6) {
                    confirmPassword = value6!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        writeData();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    },
                    child: Text(
                      "Reg",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
