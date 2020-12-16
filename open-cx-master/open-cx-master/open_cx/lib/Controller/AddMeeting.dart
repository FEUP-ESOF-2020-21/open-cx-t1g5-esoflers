import 'package:flutter/material.dart';
import 'package:open_cx/Model/Session.dart';
import 'package:open_cx/View/Schedule/Schedule.dart';
import 'package:open_cx/globals.dart';

class AddMeetingPage extends StatefulWidget {
  @override
  _AddMeetingPageState createState() => _AddMeetingPageState();
}

class _AddMeetingPageState extends State<AddMeetingPage> {
  String dropdownValue;

  List<String> createSessionsDropDownList() {
    List<String> sessionsNameId = [];
    for (Session session in sessionsDatabase.getAllSessions()) {
      if (!session.show)
        sessionsNameId.add(session.name + " [" + session.getId().toString() + "]");
    }
    return sessionsNameId;
  }

  int parseId(String value) {
    int firstIndex = value.indexOf('[') + 1;
    int lastIndex = value.indexOf(']');
    String strId = value.substring(firstIndex, lastIndex);
    return int.parse(strId);
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
              'ADD MEETING',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Icon(
                Icons.event,
                size: 100
            ),

            SizedBox(height: 100.0),

            DropdownButton<String>(
              hint: Text('Sessions'),
              value: dropdownValue,
              dropdownColor: Color(0xA6A6A6A6),
              style: TextStyle(color: Colors.black),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: createSessionsDropDownList().map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 300.0),

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

  Widget buildButtonContainer(String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          if (name == "NEXT") {
            Session sessionToShow =  sessionsDatabase.getSessionById(parseId(dropdownValue));

            Session newSession = new Session(sessionToShow.name, sessionToShow.description, sessionToShow.date, sessionToShow.initialTime, sessionToShow.finalTime, sessionToShow.platform, true);
            newSession.setId(sessionToShow.getId());
            sessionsDatabase.updateSession(newSession);
          }
          return SchedulePage();
        }
        )
        );
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
