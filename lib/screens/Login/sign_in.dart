import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../test_all/banner.dart';
import '../Home_page/Navigation bar.dart';

class My_signin extends StatefulWidget {
  const My_signin({Key? key}) : super(key: key);

  @override
  State<My_signin> createState() => _My_signinState();
}

class _My_signinState extends State<My_signin> {

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
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Stack(children: [
          Column(
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
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.black),
                              icon: Icon(
                                Icons.mail_outline,
                                color: Colors.black,
                              )),
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
                          onSaved: (value1) {
                            //email = value1!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                              hintText: " password",
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
                                          builder: (context) => Navbar1()));
                                }
                              }
                            },
                            child: Text("LOG IN")),
                      ),
                    ],
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
