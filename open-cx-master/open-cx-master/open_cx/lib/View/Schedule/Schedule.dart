import 'package:flutter/material.dart';
import 'package:open_cx/Controller/AddMeeting.dart';
import 'package:open_cx/globals.dart';
import '../../Model/Calendar.dart';
import 'ListMeetings.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  String dropdownValue;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      backgroundColor: Color(0xFF9CBDCE),
      resizeToAvoidBottomPadding: false,

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            AppBar(
              title: Text('SCHEDULE'),

              actions:[

                buildButtonContainer("-", Icon(Icons.edit)),
                buildButtonContainer("+", Icon(Icons.add_circle_outline))],
            ),
            
            Calendar(sessionsDatabase.getShowSessions())
          ],
        ),
      ),
    );
  }

  Widget buildButtonContainer(String name,Icon icon) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          switch (name) {
            case "+":
              return AddMeetingPage();
            case "-":
               return ListMeetingPage();
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
        ),
        child: Center(
          child: icon,
            ),
          ),
    );
  }
}
