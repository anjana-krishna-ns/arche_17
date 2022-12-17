import 'package:flutter/material.dart';
class FormFieldSampleState extends StatefulWidget {
  const FormFieldSampleState({Key? key}) : super(key: key);

  @override
  State<FormFieldSampleState> createState() => _FormFieldSampleStateState();
}

class _FormFieldSampleStateState extends State<FormFieldSampleState> {

  bool _obscureText = true;
 // late final _password = GlobalKey<FormState>();
  //String ?password;
  late String _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text("Sample"),
      ),
      body:  Container(
        child:  Column(
          children: <Widget>[
             TextFormField(
              decoration:  InputDecoration(
                  labelText: 'Password',
                  icon:  Padding(
                      padding:  EdgeInsets.only(top: 15.0),
                      child:  Icon(Icons.remove_red_eye_outlined))),
              validator: (val) => val!.length < 6 ? 'Password too short.' : null,
              onSaved: (val) => _password = val!,
              obscureText: _obscureText,
            ),
             TextButton(
                onPressed: _toggle,
                child: new Text(_obscureText ? "Show" : "Hide"))
          ],
        ),
      ),
    );
  }
}