import 'package:flutter/material.dart';
import 'package:hello/Session.dart';
import 'Calendar.dart';

// Acho que agora funcionou mais ou menos mas está a aparecer uma barra amarela e preta de perigo no android
// Vou tentar comentar os widgets anteriores para ver se dá
// O perigo faz parte da nossa profissão xD
// Só uma cena, esse calendário é o do ano passado? É tipo o já existente do projeto?
// Yas, só que não podemos usar o calendário do ano passado diretamente porque eles usavam uma classe Talk que tinha coisas que eu não percebia o que era
// Okz, então queremos criar o nosso próprio calendário um bocado diferente do outro para pormos as nossas sessoes?
// Yas, mas acho que agora está a funcionar mais ou menos, só que aparece aquela barra amarela estranha e não está a aparecer a sessão que pus no construtor
// Vou te mandar print para o messenger. Yas

void main() {
  runApp(MyApp());
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
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
            ),
            Calendar([new Session(1, "ola", new DateTime(2020, 12, 8), new TimeOfDay(hour: 2, minute: 30), new TimeOfDay(hour: 4, minute: 0), _selectedPlatform)])
          ],
        ),
      ),
    );
  }
}