import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Session.dart';
import 'package:url_launcher/url_launcher.dart';

class Calendar extends StatefulWidget {
  final List<Session> sessionList;

  const Calendar(this.sessionList);

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  
  int totalHoursInDay = 24;

  int firstBlock = 0;
  int finalBlock = 0;
  int numBlocks = 0;
  double blockSize = 0.04;
  double visibleHeightFactor = 0.8;
  int numberOfDaysToDisplay = 7;
  ScrollController _controller1;
  ScrollController _controller2;

  //List<DateTime> daysList = [new DateTime(2019, 12, 8, 8, 0), new DateTime(2019, 12, 9, 8, 0),new DateTime(2019, 12, 10, 8, 0),new DateTime(2019, 12, 11, 8, 0),new DateTime(2019, 12, 12, 8, 0),new DateTime(2019, 12, 13, 8, 0)];
  List<ScrollController> controllers = new List<ScrollController>();

  /*final List<String> timeInterval = [
    "08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 AM", "12:30 AM",
    "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM", "06:00 PM", "07:00 PM", "08:00 PM", "09:00 PM", "10:00 PM", "11:00 PM"
  ];*/

  final List<String> timeInterval = [];
  List<DateTime> daysList = [];

  CalendarState() {
    createTimeIntervals();
    createDayList();
  }
  
  void createTimeIntervals() {
    for (int i = 0; i < totalHoursInDay; i++) {
      timeInterval.add(createTimeString(i, 0));
      timeInterval.add(createTimeString(i, 30));
    }
  }

  void createDayList() {
    // get current date
    DateTime today = new DateTime.now();
    daysList.add(today);

    for (int i = 1; i < 6; i++) {
      daysList.add(today.add(new Duration(days: i)));
    }

    /*for (int i = 10; i < 16; i++) {
      daysList.add(new DateTime(2019, 12, i, 8, 0));
    }*/
  }

  String createTimeString(int hour, int minute) {
    return hour.toString().padLeft(2, '0') + ":" + minute.toString().padLeft(2, '0');
  }

  List<String> createIntervals(int firstHour, int firstMinutes, int lastHour, int lastMinutes) {
    String firstTime = firstHour.toString().padLeft(2,'0')  + ":" + firstMinutes.toString().padLeft(2,'0') ;
    String lastTime = lastHour.toString().padLeft(2,'0')  + ":" + lastMinutes.toString().padLeft(2,'0') ;
    int differenceHours = lastHour-firstHour;
    int differenceBlocks = differenceHours * 2;
    List<String> finalList = new List();
    int currentHour = firstHour;
    int currentMinutes = firstMinutes;
    finalList.add(firstTime);

    if(firstMinutes != 0)
      differenceBlocks -= 1;

    if(lastMinutes != 0)
      differenceBlocks += 1;

    for(int i = 1; i < differenceBlocks; i ++) {
      currentMinutes += 30;
      if(currentMinutes == 60){
        currentHour ++;
        currentMinutes = 0;
      }

      finalList.add(currentHour.toString().padLeft(2,'0') + ":" + currentMinutes.toString().padRight(2,'0'));
      print(finalList[i]);
    }
    finalList.add(lastTime);

    return finalList;
  }

  @override
  void initState() {

    super.initState();
    createControllers();
    _controller1 = ScrollController();
    _controller1.addListener(listener1);
    _controller2 = ScrollController();
    _controller2.addListener(listener2);
  }

  void listener1() {
    for(int i = 0; i < controllers.length; i++){
      controllers[i].jumpTo(_controller1.offset);
    }
  }

  void listener2() {
    _controller1.jumpTo(_controller2.offset);
  }

  void createControllers() {
    for(int i = 0; i < daysList.length; i++){
      controllers.add(new ScrollController());
      controllers[i].addListener(listener1);
    }
  }

  String convertWeekDay(int day){
    switch (day) {
      case 1: return "MON";
      case 2: return "TUE";
      case 3: return "WED";
      case 4: return "THU";
      case 5: return "FRI";
      case 6: return "SUN";
      case 7: return "SAT";
      default: return "nada";
    }
  }

  String convertMonth(int month){
    switch (month) {
      case 1: return "JAN";
      case 2: return "FEB";
      case 3: return "MAR";
      case 4: return "APR";
      case 5: return "MAY";
      case 6: return "JUN";
      case 7: return "JUL";
      case 8: return "AUG";
      case 9: return "SET";
      case 10: return "OCT";
      case 11: return "NOV";
      case 12: return "DEC";
      default: return "nada";
    }
  }

// Usado para facilitar a colocaçao dos blocos na tabela
  void convertToBlocks(TimeOfDay initTime, TimeOfDay finalTime){
    firstBlock = (initTime.hour*2 + (initTime.minute)/30).round();
    finalBlock = (finalTime.hour*2 + (finalTime.minute)/30).round();
    numBlocks = finalBlock - firstBlock;
  }

  Widget individualTalkBlock(int i, int j, Color backColor, Color blockColor){
    int finalBlockBefore = finalBlock;
    convertToBlocks(widget.sessionList[j].initialTime, widget.sessionList[j].finalTime);
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              color: backColor.withOpacity(0),
              height: MediaQuery.of(context).size.height * blockSize * (firstBlock-finalBlockBefore),
              width: MediaQuery.of(context).size.width,
            ),
            GestureDetector(
              /*onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)  => TalkPage(talk: widget.talkList[j])));
              },*/
            //onTap: () => launch('https://www.facebook.com/'),
            child: Container(
                color: widget.sessionList[j].color,
                height: MediaQuery.of(context).size.height * blockSize * numBlocks,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      widget.sessionList[j].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 12
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: numBlocks,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

  Widget individualTimeBlock(int i){
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      child: Text(
        timeInterval[i],
        style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 10
        ),
      ),
      color: Colors.white,
      height: MediaQuery.of(context).size.height * blockSize,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget dayHeaderContainer(int i, Color color) {
    return Container(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                convertWeekDay(daysList[i].weekday),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF444444),
                    fontSize: 20
                ),
              ),
              Text(
                daysList[i].day.toString() + convertMonth(daysList[i].month),
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13
                ),
              ),
            ],
          ),
        ],
      ),
      color: color,
      height: MediaQuery.of(context).size.height * 2*blockSize,
    );
  }

  Widget blockContainer(int i, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * visibleHeightFactor,
      color: color,
      child: ListView(
        scrollDirection: Axis.vertical,
        controller: controllers[i],
        children: <Widget>[
          for(int j = 0; j < widget.sessionList.length; j++)
            if(daysList[i].day == widget.sessionList[j].date.day)
              individualTalkBlock(i, j, color, Color.fromARGB(255,247,220,222)),
          Container(
            color: Colors.black.withOpacity(0),
            height:MediaQuery.of(context).size.height * blockSize * (timeInterval.length-finalBlock),
          ),
        ],
      ),
    );
  }

  Widget timeContainer() {
    return Container(
      child: ListView(
        children: <Widget> [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 2*blockSize,
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * visibleHeightFactor,
            color: Colors.white,
            child: ListView(
              controller: _controller1,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                for(int i = 0; i < timeInterval.length; i++)
                  individualTimeBlock(i),
              ],
            ),
          ),
        ],
      ),
      alignment: Alignment.topLeft,
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height,
    );
  }

  Widget daysContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * (1- 0.15),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for(int i = 0 ; i < daysList.length ; i ++)
                dayContainer(i),
            ],
          ),
          Container(
            child: ListView(
              controller: _controller2,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  color: Colors.blue.withOpacity(0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * blockSize * 21,
                ),
              ],
            ),
            margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
            color: Colors.black.withOpacity(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ],
      ),
    );
  }

  Widget dayContainer(int i){
    Color color1;
    Color color2;

    if((i%2) != 0){
      color1= Color.fromARGB(255,240,240,240);
      color2= Color.fromARGB(255,250,250,250);
    }
    else{
      color2= Color.fromARGB(255,240,240,240);
      color1= Color.fromARGB(255,250,250,250);
    }
    finalBlock=0;

    return Container(
      child: ListView(
        children: <Widget>[
          dayHeaderContainer(i, color1),
          blockContainer(i, color2),
        ],
      ),
      alignment: Alignment.topLeft,
      color: color2,
      width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.15)) * 0.3333,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            timeContainer(),
            daysContainer(),
          ],
        )
    );
  }
}