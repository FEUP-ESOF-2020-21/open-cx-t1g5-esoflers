import 'package:flutter/material.dart';
import 'package:open_cx/View/Menu/Menu.dart';

import 'RecoverPassword.dart';
import 'package:open_cx/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              'LOGIN',
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

            buildTextField("Username"),

            SizedBox(height: 20.0),

            buildTextField("Password"),

            SizedBox(height: 50.0),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => RecoverPasswordPage()
                      ));
                    },
                    child: Text(
                      "Forgot your Password?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 230.0),

            Container(
              child: Row(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: buildButtonContainer("CANCEL")
                    ),
                    
                    SizedBox(width: 80.0),

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
        
        prefixIcon: hintText == "Username"
            ? Icon(Icons.account_circle)
            : Icon(Icons.lock),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer(String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
          switch (name) {
            case "CANCEL":
              return HomePage();
            case "NEXT":
               return MenuPage();
            default:
              return null;
          }
        }));
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
