import 'package:flutter/material.dart';
import 'package:open_cx/Model/Session.dart';
import 'package:open_cx/View/Schedule/Schedule.dart';
import 'package:open_cx/View/Schedule/ViewMeeting.dart';
import '../globals.dart';

class EditMeeting extends StatefulWidget {

  Session sessionToEdit;
  EditMeeting(Session s) {
    sessionToEdit = new Session(s.name, s.description, s.date, s.initialTime, s.finalTime, s.platform, s.show);
    sessionToEdit.setId(s.getId());
  }

  @override
  _EditMeetingPageState createState() => _EditMeetingPageState();
}

class _EditMeetingPageState extends State<EditMeeting> {

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
              'EDIT MEETING',
              style: TextStyle(
                fontSize: 45.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20.0),

            Icon(
                Icons.create,
                size: 100
            ),

            buildTextField("Change Name:"),

            TextField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal),
                    ),
                ),
                onChanged: (value) {
                  widget.sessionToEdit.name = value;
                }
            ),

            SizedBox(
              height: 20.0,
            ),

            buildTextField("Change Description:"),

            TextField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)
                    ),
                ),
                onChanged: (value) {
                  widget.sessionToEdit.description = value;
                }
            ),

            SizedBox(
              height: 50.0,
            ),

            RaisedButton(
              child: Text(widget.sessionToEdit.date == null ? 'Date: ' : 'Date: ' +  widget.sessionToEdit.date.day.toString() + '/' + widget.sessionToEdit.date.month.toString() + '/' + widget.sessionToEdit.date.year.toString()),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: widget.sessionToEdit.date == null ? DateTime.now() : widget.sessionToEdit.date,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                ).then((date) {
                  setState(() {
                    widget.sessionToEdit.date = date;
                  });
                });
              },
            ),

            RaisedButton(
              child: Text(widget.sessionToEdit.initialTime == null ? 'Initial Time: ' : 'Initial time: ' +  widget.sessionToEdit.initialTime.hour.toString() + ":" + widget.sessionToEdit.initialTime.minute.toString()),
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: widget.sessionToEdit.initialTime == null ? TimeOfDay.now() : widget.sessionToEdit.initialTime,
                ).then((time) {
                  setState(() {
                    widget.sessionToEdit.initialTime = time;
                  });
                });
              },
            ),

            RaisedButton(
              child: Text(widget.sessionToEdit.finalTime == null ? 'Final Time: ' : 'Final time: ' +  widget.sessionToEdit.finalTime.hour.toString() + ":" + widget.sessionToEdit.finalTime.minute.toString()),
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: widget.sessionToEdit.finalTime == null ? TimeOfDay.now() : widget.sessionToEdit.finalTime,
                ).then((time) {
                  setState(() {
                    widget.sessionToEdit.finalTime = time;
                  });
                });
              },
            ),

            DropdownButton<String>(
              hint: Text('Platform'),
              value: widget.sessionToEdit.platform,
              onChanged: (platform) {
                setState(() {
                  widget.sessionToEdit.platform = platform;
                });
              },
              items: <String>['Jitsi','Zoom', 'Teams'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),


            Container(
              child: Row(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: buildButtonContainer("CANCEL")
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: buildButtonIconContainer("DELETE MEETING")
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
              return ViewMeeting(widget.sessionToEdit);
            case "NEXT":
              sessionsDatabase.updateSession(widget.sessionToEdit);
               return SchedulePage();
            default:
              return null;
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

  Widget buildButtonIconContainer(String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          switch (name) {
            case "DELETE MEETING":
              Session newSession = new Session(widget.sessionToEdit.name, widget.sessionToEdit.description, widget.sessionToEdit.date, widget.sessionToEdit.initialTime, widget.sessionToEdit.finalTime, widget.sessionToEdit.platform, false);
              newSession.setId(widget.sessionToEdit.getId());
              sessionsDatabase.updateSession(newSession);
              return SchedulePage();
            default:
              return null;
          }
        }
        ));
      },
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF9CBDCE),
        ),
        child: Center(
          child: Icon(
                Icons.delete_forever,
                size: 40
          ),
        ),
      ),
    );
  }
}