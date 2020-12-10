import 'package:flutter/material.dart';

class Session {
  int id;
  String name;
  DateTime date;
  TimeOfDay initialTime, finalTime;
  String platform;
  Color color;
  String link;

  Session (int id, String name, DateTime date, TimeOfDay initialTime, TimeOfDay finalTime, String platform) {
    this.id = id;
    this.name = name;
    this.date = date;
    this.initialTime = initialTime;
    this.finalTime = finalTime;
    this.platform = platform;
    color = new Color(0xFFFF9000);
  }
}