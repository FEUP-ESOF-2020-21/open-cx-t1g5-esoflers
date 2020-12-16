import 'package:flutter/material.dart';
import 'package:open_cx/View/Menu/Menu.dart';
import 'package:open_cx/View/Profile/EditProfile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedPlatform;

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

            Container(
              child: Row(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: buildButtonContainer("MENU", Icon(Icons.menu))
                    ),

                    SizedBox(width: 270.0),

                    Align(
                        alignment: Alignment.topRight,
                        child: buildButtonContainer("EDIT",Icon(Icons.create))
                    ),
                  ],
              ),
            ),

            Text(
              'PROFILE',
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

            buildTextField("Name"),

            SizedBox(height: 20.0),

            buildTextField("Mail"),

            SizedBox(height: 170.0),

            DropdownButton<String>(
              hint: Text('CREATED MEETINGS'),
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

  Widget buildButtonContainer(String name,Icon icon) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          switch (name) {
            case "MENU":
              return MenuPage();
            case "EDIT":
               return EditProfilePage();
            default:
              return null;
          }
        }));
      },
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width / 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xA6A6A6A6),
        ),
        child: Center(
          child: icon,
            ),
          ),
    );
  }
}
