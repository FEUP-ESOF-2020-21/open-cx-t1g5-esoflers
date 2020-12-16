import 'package:flutter/material.dart';

class Session {
  int _id;
  Color color;
  String name, description;
  DateTime date;
  TimeOfDay initialTime, finalTime;
  String platform;
  bool show;

  Session ([this.name, this.description, this.date, this.initialTime, this.finalTime, this.platform, this.show]) {
    this._id = new DateTime.now().millisecondsSinceEpoch;
    this.color = new Color(0xFFFF9000);
  }

  int getId() {
    return this._id;
  }

  void setId(int newId) {
    this._id = newId;
  }
}