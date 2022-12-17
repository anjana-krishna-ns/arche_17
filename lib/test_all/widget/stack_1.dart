import 'package:flutter/material.dart';

class DemoClass extends StatefulWidget {
  _DemoClassState createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {
  int _selectedIndex = -1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 50,
              color: _selectedIndex == index ? Colors.blue : Colors.transparent,
              child: ListTile(
                title: Text('This is some title'),
                onTap: () => setState(() {
                  _selectedIndex = index;
                }),
              ),
            );
          }
      ),
    );
  }
}

