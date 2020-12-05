import 'package:flutter/material.dart';

class Session {
  int id;
  String name;
  DateTime date;
  TimeOfDay initialTime, finalTime;
  String platform;
  Color color;
  String link;

  Session (int id, String name, DateTime date, TimeOfDay initialTime, TimeOfDay finalTime, String platform, String link) {
    this.id = id;
    this.name = name;
    this.date = date;
    this.initialTime = initialTime;
    this.finalTime = finalTime;
    this.platform = platform;
    this.link = link;
    color = new Color(0xFFFF9000);
  }
}