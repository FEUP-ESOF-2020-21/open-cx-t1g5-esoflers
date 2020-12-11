import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/Login/login.dart';
import 'Screens/Login/signUp.dart';
import 'package:open_cx/globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sessionsDatabase.requestSessions();
  print("Sessions request length: " + sessionsDatabase.getAllSessions().length.toString());
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
        "/login": (context) => LoginPage(),//ViewMeeting(),//CreateMeeting(),//AddMeetingPage(),//EditScheduleMenu(),//MenuPage(),//LoginPage(),
        "/signUp": (context) => SignUpPage(), //SchedulePage(), //EditMeeting(),//SignUpPage(),
        //"/agendAppMain": (context) => AgendAppMain()
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "VIDEO SESSION TOOLKIT",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            height: 7.5,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Icon(
                          Icons.calendar_today,
                          size: 100,
                      ),
                    ],
                  ),
              ),
              MyButton(x: 40, y: 60, title: "Login", onPressed: () => Navigator.of(context).pushNamed("/login")),
              MyButton(x: 40, y: 70, title: "Sign Up", onPressed: () => Navigator.of(context).pushNamed("/signUp")),
              //MyButton(x: 70, y: 60, title: "AgendAppskkit", onPressed: () => Navigator.of(context).pushNamed("/agendAppMain"))
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
      child: FlatButton(
        onPressed: onPressed,
        color: Color(0xA6A6A6A6),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold
          ),
        ),
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