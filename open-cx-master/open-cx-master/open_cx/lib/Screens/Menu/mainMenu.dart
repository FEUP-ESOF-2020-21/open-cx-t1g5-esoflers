import 'package:flutter/material.dart';
import 'package:open_cx/Screens/Program/TalkPage/TalkPage.dart';
import 'package:open_cx/Screens/Schedule/createMeeting.dart';
import 'package:open_cx/Screens/Profile/profile.dart';

import 'package:open_cx/main.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9CBDCE),
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 25.0, left: 25.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'MENU',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 150.0,
            ),
        
            Container(
              child: Column(
                  children: <Widget>[
                    Container(
                    child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 20.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                        alignment: Alignment.center,
                        child: buildButtonContainer("CREATE MEETING")
                    ),
                    
                    Container(
                    child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 20.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                        alignment: Alignment.center,
                        child: buildButtonContainer("PROFILE")
                    ),
                    
                    Container(
                    child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 20.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    Align(
                        alignment: Alignment.center,
                        child: buildButtonContainer("SCHEDULE")
                    ),

                    Container(
                    child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 20.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                        alignment: Alignment.center,
                        child: buildButtonContainer("LOG OUT")
                    ),

                    Container(
                    child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 20.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.black,
                            ),
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
    );
  }

  

  Widget buildButtonContainer(String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          switch (name) {
            case "CREATE MEETING":
              return CreateMeeting();
            case "PROFILE":
              return ProfilePage();
            case "SCHEDULE":
              return TalkPage();
            case "LOG OUT":
              return HomePage();
            default:
          }
        }
        ));
      },
      child: Container(
        height: 20.0,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF9CBDCE),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
