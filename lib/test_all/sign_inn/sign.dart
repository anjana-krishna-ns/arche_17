import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/Home_page/Navigation bar.dart';
import '../../screens/Home_page/home.dart';
import '../../screens/Login/firebase_reg.dart';
import '../Login/sign+in.dart';
import '../banner.dart';

class My_signinn extends StatefulWidget {
  const My_signinn({Key? key}) : super(key: key);

  @override
  State<My_signinn> createState() => _My_signinnState();
}

class _My_signinnState extends State<My_signinn> {
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
    return WillPopScope(
      onWillPop: () async=>false ,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          alignment: Alignment.center,
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white24,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
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

                          margin: EdgeInsets.only(left: 30, right: 30),
                          width: 450,
                          alignment: Alignment.center,
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
                          ),
                        ),
                        // ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.red,
                        //         shape: StadiumBorder()),
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => registerpage()));
                        //     },
                        //     child: Text('don,t have account')),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>registerpage()));
                          },
                          child: Text("don't have account"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        _signInButton()
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      //splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
