import 'package:flutter/material.dart';
import 'package:open_cx/Screens/Profile/profile.dart';

import '../Menu/mainMenu.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _isHidden = true;
  String _selectedPlatform;

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
              'EDIT PROFILE',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox( height: 20.0),

            Icon(
                Icons.account_box,
                size: 100
            ),

            SizedBox(height: 60.0),

            buildTextField("Change Name:"),

            TextField(
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            buildTextField("Change Email:"),

            TextField(
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            DropdownButton<String>(
              hint: Text('EDIT CREATED MEETINGS'),
              value: _selectedPlatform,
              onChanged: (platform) {
                setState(() {
                  _selectedPlatform = platform;
                });
              },
              items: <String>['ID1','ID2', 'ID3'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),

            SizedBox(
              height: 100.0,
            ),

            Container(
              child: Row(
                children: <Widget>[
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: buildButtonContainer("CANCEL")
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: buildButtonContainer("NEXT")
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      style: new TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget buildButtonContainer(String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          switch (name) {
            case "CANCEL":
              return ProfilePage();
            case "NEXT":
              return ProfilePage();
            default:
          }
        }
        ));
      },
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width / 3,
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
