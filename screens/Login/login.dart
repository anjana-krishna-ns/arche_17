//old
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home_page/home.dart';
import 'Button.dart';
import 'Forgot.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool checkedValue = false;
  bool register = true;
  List textfieldsStrings = [
    "", //firstName
    "", //lastName
    "", //phonenumber
    "", //email
    "", //password
    "", //confirmPassword
  ];

  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _phonenumkey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Align(
                            child: Text(
                              'Hey there,',
                              style: GoogleFonts.poppins(
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff1D1617),
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Align(
                            child: register
                                ? Text(
                                    'Create an Account',
                                    style: GoogleFonts.poppins(
                                      color: isDarkMode
                                          ? Colors.white
                                          : const Color(0xff1D1617),
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    'Welcome Back',
                                    style: GoogleFonts.poppins(
                                      color: isDarkMode
                                          ? Colors.white
                                          : const Color(0xff1D1617),
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                        ),
                        register
                            ? buildTextField(
                                "First Name",
                                Icons.person,
                                false,
                                size,
                                (valuename) {
                                  if (valuename!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(valuename)) {
                                    return "Enter Valid Name";
                                  } else {
                                    return null;
                                  }
                                },
                                _firstnamekey,
                                0,
                                isDarkMode,
                              )
                            : Container(),
                        register
                            ? buildTextField(
                                "Last Name",
                                Icons.person,
                                false,
                                size,
                                (valuesurname) {
                                  if (valuesurname!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(valuesurname)) {
                                    return "Enter Valid Name";
                                  } else {
                                    return null;
                                  }
                                },
                                _lastNamekey,
                                1,
                                isDarkMode,
                              )
                            : Container(),
                        buildTextField("phone number", Icons.phone, false, size,
                            (valuephone) {
                          if (valuephone!.isEmpty) {
                            return 'Enter valid number';
                          }
                          if (valuephone!.isEmpty ||
                              !RegExp(r'^(?:[+0]9)?[0-9]{10}$')
                                  .hasMatch(valuephone)) {
                            return "Enter Valid number";
                          }
                          if (valuephone.length < 10 ||
                              valuephone.length > 10) {
                            return 'The number must be 10 digit';
                          } else {
                            return null;
                          }
                        }, _phonenumkey, 2, isDarkMode),
                        Container(),
                        buildTextField(
                          "Email",
                          Icons.email,
                          false,
                          size,
                          (valuemail) {
                            if (valuemail.length < 5) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(valuemail)) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;
                          },
                          _emailKey,
                          3,
                          isDarkMode,
                        ),
                        Container(),
                        // bool validateStructure(String value){
                        // String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        // RegExp regExp = new RegExp(pattern);
                        // return regExp.hasMatch(value);
                        buildTextField(
                            "Passsword", Icons.lock_outline, true, size,
                            (valuepassword) {
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
                            return "Passsword should Contain atleast 1 symbol,Uppercase or number";
                          }
                        }, _passwordKey, 4, isDarkMode),
                        Container(),
                        register
                            ? buildTextField(
                                "Confirm Passsword",
                                Icons.lock_outline,
                                true,
                                size, (valuepassword) {
                                if (valuepassword != textfieldsStrings[4]) {
                                  buildSnackError(
                                    'Passwords must match',
                                    context,
                                    size,
                                  );
                                  return '';
                                }
                                return null;
                              }, _confirmPasswordKey, 5, isDarkMode)
                            : Container(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.015,
                            vertical: size.height * 0.025,
                          ),
                          child: register
                              ? CheckboxListTile(
                                  title: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "By creating an account, you agree to our ",
                                          style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: size.height * 0.015,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: InkWell(
                                            onTap: () {
                                              // ignore: avoid_print
                                              print('Conditions of Use');
                                            },
                                            child: Text(
                                              "Conditions of Use",
                                              style: TextStyle(
                                                color: const Color(0xffADA4A5),
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: size.height * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: " and ",
                                          style: TextStyle(
                                            color: const Color(0xffADA4A5),
                                            fontSize: size.height * 0.015,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: InkWell(
                                            onTap: () {
                                              // ignore: avoid_print
                                              print('Privacy Notice');
                                            },
                                            child: Text(
                                              "Privacy Notice",
                                              style: TextStyle(
                                                color: const Color(0xff181414),
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: size.height * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  activeColor: Colors.black,
                                  value: checkedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValue = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: const Color(0xffADA4A5),
                                      decoration: TextDecoration.underline,
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ),
                        ),
                        AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: register
                              ? EdgeInsets.only(top: size.height * 0.025)
                              : EdgeInsets.only(top: size.height * 0.085),
                          child: ButtonWidget(
                            text: register ? "Register" : "Login",
                            backColor: isDarkMode
                                ? [
                                    Colors.black,
                                    Colors.black,
                                  ]
                                : const [Color(0xff8694c18), Color(0xff000203)],
                            textColor: const [
                              Colors.white,
                              Colors.white,
                            ],
                            onPressed: () async {
                              if (register) {
                                //validation for register
                                if (_firstnamekey.currentState!.validate()) {
                                  if (_lastNamekey.currentState!.validate()) {
                                    if (_phonenumkey.currentState!.validate()) {
                                      if (_emailKey.currentState!.validate()) {
                                        if (_passwordKey.currentState!
                                            .validate()) {
                                          if (_confirmPasswordKey.currentState!
                                              .validate()) {
                                            if (checkedValue == false) {
                                              buildSnackError(
                                                  'Accept our Privacy Policy and Term Of Use',
                                                  context,
                                                  size);
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()));
                                              print('register');
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              } else {
                                //validation for login
                                if (_emailKey.currentState!.validate()) {
                                  if (_passwordKey.currentState!.validate()) {
                                    print('login');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                }
                              }
                              print("");
                            },
                          ),
                        ),
                        AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.only(
                            top: register
                                ? size.height * 0.025
                                : size.height * 0.15,
                          ),
                          child: Row(
                            //TODO: replace text logo with your logo
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'LOGIN',
                                style: GoogleFonts.poppins(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: size.height * 0.023,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: register
                                    ? "Already have an account? "
                                    : "Don???t have an account yet? ",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () => setState(() {
                                    if (register) {
                                      register = false;
                                    } else {
                                      register = true;
                                    }
                                  }),
                                  child: register
                                      ? Text(
                                          "Login",
                                          style: TextStyle(
                                            foreground: Paint()
                                              ..shader = const LinearGradient(
                                                colors: <Color>[
                                                  Colors.black26,
                                                  Colors.black26,
                                                ],
                                              ).createShader(
                                                const Rect.fromLTWH(
                                                  0.0,
                                                  0.0,
                                                  200.0,
                                                  70.0,
                                                ),
                                              ),
                                            fontSize: size.height * 0.018,
                                          ),
                                        )
                                      : Text(
                                          "Register",
                                          style: TextStyle(
                                            foreground: Paint()
                                              ..shader = const LinearGradient(
                                                colors: <Color>[
                                                  Color(0xff030303),
                                                  Color(0xff030303),
                                                ],
                                              ).createShader(
                                                const Rect.fromLTWH(
                                                    0.0, 0.0, 200.0, 70.0),
                                              ),
                                            // color: const Color(0xffC58BF2),
                                            fontSize: size.height * 0.018,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;

  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.012,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff1a1819),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff1a1819),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
