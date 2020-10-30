import 'package:flutter/material.dart';
import 'AgendApp.dart';
import 'package:flutter/services.dart';

import 'Screens/Login/login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF9CBDCE), // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Session Toolkit Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF9CBDCE),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/agendAppMain": (context) => AgendAppMain()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF9CBDCE),
          child: Stack(
            children: <Widget>[
              Center(
                  child: Text("Video Session Toolkit",
                      style: TextStyle(fontSize: 32, color: Colors.black))),
              MyButton(x: 14, y: 60, title: "Login", onPressed: () => Navigator.of(context).pushNamed("/login")),
              MyButton(x: 40, y: 30, title: "Sign Up", onPressed: () => Navigator.of(context).pushNamed("/signUp")),
              MyButton(x: 70, y: 60, title: "AgendAppskkit", onPressed: () => Navigator.of(context).pushNamed("/agendAppMain"))
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.x, this.y, this.title, this.onPressed});

  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        heroTag: title,
      ),
    );
  }
}

class YourProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Project"),
      ),
      body: Center(
        child: Text("MyApp"),
      ),
    );
  }
}