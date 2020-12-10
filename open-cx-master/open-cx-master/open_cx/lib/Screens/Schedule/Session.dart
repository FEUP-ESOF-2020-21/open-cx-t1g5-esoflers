import 'package:flutter/material.dart';

class Session {
  String name;
  DateTime date;
  TimeOfDay initialTime, finalTime;
  String platform;
  Color color;
  String showCalendar;

  Session (String name, DateTime date, TimeOfDay initialTime, TimeOfDay finalTime, String platform) {
    this.name = name;
    this.date = date;
    this.initialTime = initialTime;
    this.finalTime = finalTime;
    this.platform = platform;
    this.showCalendar = "FALSE";
    color = new Color(0xFFFF9000);
  }
}