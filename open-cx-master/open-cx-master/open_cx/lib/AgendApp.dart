import 'dart:ui';

import 'package:flutter/material.dart';

import 'Screens/Login/login.dart';

class AgendAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Color(0xFF9CBDCE),
          primaryColor: Color(0xFF9CBDCE),
          cursorColor: Color(0xFF9CBDCE),
          textSelectionColor: Color(0xFF9CBDCE),
          textSelectionHandleColor: Color(0xFF9CBDCE),
          fontFamily: "Ubuntu"),
      home: LoginPage(), //todo MainPage()?
    );
  }
}
