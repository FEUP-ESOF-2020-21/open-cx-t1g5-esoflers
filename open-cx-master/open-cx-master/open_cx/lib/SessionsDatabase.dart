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
      'initialTime': session.initialTime.hour.toString() + ":" + session.initialTime.minute.toString(),
      'finalTime': session.finalTime.hour.toString() + ":" + session.finalTime.minute.toString(),
      'platform': session.platform,
      'show': session.show
    });
  }
  
  void updateSession(Session session) {
    
    for (int i = 0; i < this._sessions.length; i++) {
      if (this._sessions[i].getId() == session.getId()) {
        this._sessions[i] = session;
        break;
      }
    }

    /*for (Session s in this._sessions) {
      if (s.getId() == session.getId()) {
        s.name = session.name;
        s = session
        break;
      }
    }*/

    FirebaseFirestore.instance.collection('Sessions').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        if (ds['id'] == session.getId()) ds.reference.update({
          'id': session.getId(),
          'name': session.name,
          'description': session.description,
          'date': session.date.toString(),
          'initialTime': session.initialTime.hour.toString() + ":" + session.initialTime.minute.toString(),
          'finalTime': session.finalTime.hour.toString() + ":" + session.finalTime.minute.toString(),
          'platform': session.platform,
          'show': session.show
        });
      }
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

    FirebaseFirestore.instance.collection('Sessions').get().then((snapshot) {
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

  Session getSessionById(int id) {
    for (Session session in this._sessions) {
      if (session.getId() == id) return session;
    }
    return new Session();
  }
}