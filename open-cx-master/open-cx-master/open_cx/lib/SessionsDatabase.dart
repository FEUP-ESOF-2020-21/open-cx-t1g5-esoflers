import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_cx/Screens/Schedule/Session.dart';

class SessionsDatabase {
  List<Session> _sessions = [];

  void requestSessions() {
    Session session;
    
    Future<Null> sessions = FirebaseFirestore.instance.collection("Sessions").get().then((value) {
      var docs = value.docs;
      for (int i = 0; i < docs.length; i++) {
        session = new Session();
        session.setId(docs[i]['id']);
        session.name = docs[i]['name'];
        session.description = docs[i]['description'];
        session.date = DateTime.parse(docs[i]['date']);
        session.initialTime = TimeOfDay(hour:int.parse(docs[i]['initialTime'].split(":")[0]),minute: int.parse(docs[i]['initialTime'].split(":")[1]));
        session.finalTime = TimeOfDay(hour:int.parse(docs[i]['finalTime'].split(":")[0]),minute: int.parse(docs[i]['finalTime'].split(":")[1]));
        session.platform = docs[i]['platform'];
        session.show = docs[i]['show'];
        this._sessions.add(session);
      }
    });
  }

  void addSession(Session session) {
    this._sessions.add(session);
    CollectionReference sessionsCollection = FirebaseFirestore.instance.collection("Sessions");
    sessionsCollection.add({
      'id': session.getId(),
      'name': session.name,
      'description': session.description,
      'date': session.date.toString(),
      'initialTime': session.initialTime.toString(),
      'finalTime': session.finalTime.toString(),
      'platform': session.platform,
      'show': session.show
    });
  }

  void removeSession(int id) {
    int removeIndex = -1;
    for (int i = 0; i < this._sessions.length; i++) {
      if (this._sessions[i].getId() == id) {
        removeIndex = i;
        break;
      }
    }
    this._sessions.removeAt(removeIndex);

    FirebaseFirestore.instance.collection('messages').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        if (ds['id'] == id) ds.reference.delete();
      }
    });
  }

  List<Session> getAllSessions() {
    return this._sessions;
  }

  List<Session> getShowSessions() {
    List<Session> showSessions = [];
    for (Session session in this._sessions) {
      if (session.show) showSessions.add(session);
    }
    return showSessions;
  }
}