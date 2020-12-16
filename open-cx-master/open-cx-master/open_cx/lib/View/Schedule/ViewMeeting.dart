import 'package:flutter/material.dart';
import 'package:open_cx/Controller/EditMeeting.dart';
import 'package:open_cx/Model/Session.dart';
import 'package:open_cx/View/Schedule/Schedule.dart';

class ViewMeeting extends StatefulWidget {

  Session sessionToView;
  ViewMeeting(this.sessionToView);

  @override
  _ViewMeetingPageState createState() => _ViewMeetingPageState();
}

class _ViewMeetingPageState extends State<ViewMeeting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9CBDCE),
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 25.0, left: 25.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Text(
              'NAME: ' + widget.sessionToView.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            Text(
              'DESCRIPTION: ' + widget.sessionToView.description,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          
            Text(
                'DATE: ' +  widget.sessionToView.date.day.toString() + '/' + widget.sessionToView.date.month.toString() + '/' + widget.sessionToView.date.year.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            Text(
                'INITIAL TIME: ' +  widget.sessionToView.initialTime.hour.toString() + ":" + widget.sessionToView.initialTime.minute.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            Text(
              'FINAL TIME: ' +  widget.sessionToView.finalTime.hour.toString() + ":" + widget.sessionToView.finalTime.minute.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(
              height: 20.0,
            ),

            Text(
              'PLATAFORM: ' + widget.sessionToView.platform,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 360.0),

            Container(
              child: Row(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: buildButtonContainer("RETURN")
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: buildButtonContainer("EDIT")
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
            case "RETURN":
              return SchedulePage();
            case "EDIT":
              return EditMeeting(widget.sessionToView);
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
}