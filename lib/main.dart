import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:canwashmycar/src/home.dart';


void main() {
  runApp(
    CanWashMyCar(),
  );
}

class CanWashMyCar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Can i wash my car?',
      theme: ThemeData(
        primaryColorDark: Color(0xFF18171f),
        accentColor: Color(0xFFfff200),
        primaryColor: Color(0xFF7b7513),
      ),
      home: HomePage(),
      // home:  WhiteHomeScreen(),
    );
  }
}