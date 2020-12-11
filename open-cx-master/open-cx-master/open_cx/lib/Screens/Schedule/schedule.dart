import 'package:flutter/material.dart';
import 'package:open_cx/Screens/Schedule/addMeeting.dart';
import 'package:open_cx/globals.dart';
import 'Calendar.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  bool _isHidden = true;
  String dropdownValue;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            AppBar(
              title: Text('SCHEDULE'),
              
              actions:[buildButtonContainer("+")],
            ),
            
            Calendar(sessionsDatabase.getShowSessions())
          ],
        ),
      ),
    );
  }

  Widget buildButtonContainer(String name) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new AddMeetingPage();
        }
        )
        );
      },
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Icon(
                  Icons.add_circle_outline,
                  size: 40
                )
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreateSession(title: 'Flutter Demo Home Page'),
    );
  }
}

class CreateSession extends StatefulWidget {
  CreateSession({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CreateSessionState createState() => _CreateSessionState();
}

class _CreateSessionState extends State<CreateSession> {
  DateTime _dateTime;
  TimeOfDay _initialTimeOfDay, _finalTimeOfDay;
  String _selectedPlatform;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            /*TextField(
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)
                  ),
                  hintText: 'Name of the Session'
              ),
            ),

            //Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()), Não ligues a isto
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
              items: <String>['Zoom', 'Teams', 'Other'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),*/
            //Calendar([new Session("ola", new DateTime(2020, 12, 8), new TimeOfDay(hour: 16, minute: 0), new TimeOfDay(hour: 17, minute: 30), _selectedPlatform)])
          ],
        ),
      ),
    );
  }
}