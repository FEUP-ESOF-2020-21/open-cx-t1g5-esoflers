import 'package:flutter/material.dart';

import '../MenuOpen.dart';

class EditScheduleMenu extends StatefulWidget {
  @override
  _EditScheduleMenu createState() => _EditScheduleMenu();
}

class _EditScheduleMenu extends State<EditScheduleMenu> {
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
              'EDIT SCHEDULE',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 170.0),

            Container(
              child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: buildButtonContainer("ADD MEETING")
                    ),
                    SizedBox(
                      height:40,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: buildButtonContainer("REMOVE MEETING")
                    ),
                    SizedBox(
                      height: 350.0,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: buildButtonContainer("CANCEL")
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
          return new MenuPage();
        }
        )
        );
      },
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xA6A6A6A6),
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
