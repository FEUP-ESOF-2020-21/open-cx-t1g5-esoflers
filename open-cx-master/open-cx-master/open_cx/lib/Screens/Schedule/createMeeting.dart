import 'package:flutter/material.dart';
import 'package:open_cx/Screens/Program/TalkPage/TalkPage.dart';
import 'package:open_cx/Screens/Schedule/schedule.dart';
import 'package:open_cx/Screens/Menu/mainMenu.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingPageState createState() => _CreateMeetingPageState();
}

class _CreateMeetingPageState extends State<CreateMeeting> {
  bool _isHidden = true;
  DateTime _dateTime;
  TimeOfDay _initialTimeOfDay, _finalTimeOfDay;
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
              'CREATE MEETING',
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

            buildTextField("Name"),

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

            buildTextField("Description"),

            TextField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)
                    ),
                ),
            ),

            SizedBox(
              height: 50.0,
            ),
          
            //Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
            RaisedButton(
              child: Text(_dateTime == null ? 'Date: ' : 'Date: ' +  _dateTime.day.toString() + '/' + _dateTime.month.toString() + '/' + _dateTime.year.toString()),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                });
              },
            ),

            RaisedButton(
                child: Text(_initialTimeOfDay == null ? 'Initial Time: ' : 'Initial time: ' +  _initialTimeOfDay.hour.toString() + ":" + _initialTimeOfDay.minute.toString()),
                onPressed: () {
                  showTimePicker(
                      context: context,
                      initialTime: _initialTimeOfDay == null ? TimeOfDay.now() : _initialTimeOfDay,
                  ).then((time) {
                    setState(() {
                      _initialTimeOfDay = time;
                    });
                  });
                },
              ),

            RaisedButton(
              child: Text(_finalTimeOfDay == null ? 'Final Time: ' : 'Final time: ' +  _finalTimeOfDay.hour.toString() + ":" + _finalTimeOfDay.minute.toString()),
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: _finalTimeOfDay == null ? TimeOfDay.now() : _finalTimeOfDay,
                ).then((time) {
                  setState(() {
                    _finalTimeOfDay = time;
                  });
                });
              },
            ),

            DropdownButton<String>(
              hint: Text('Platform'),
              value: _selectedPlatform,
              onChanged: (platform) {
                setState(() {
                  _selectedPlatform = platform;
                });
              },
              items: <String>['Jitsi','Zoom', 'Teams'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 5.0),

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
              return MenuPage();
            case "NEXT":
               return SchedulePage();
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
