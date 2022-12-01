import 'package:bamx_app/globals.dart';
import 'package:firebase_database/firebase_database.dart';

import './user_api.dart';

import '../models/event.dart';
import '../models/registeredUser.dart';

DatabaseReference eventsRef = FirebaseDatabase.instance.ref('Events');
DatabaseReference userRef = FirebaseDatabase.instance.ref('Users');

Future<List<Event>> getEvents() async {
  List<Event> result = [];
  final snapshot = await eventsRef.get();
  if (snapshot.exists) {
    for (var element in snapshot.children) {
      result.add(
        Event(
          id: element.key as String,
          title: element.child('title').value as String,
          type: element.child('type').value as String,
          img: element.child('img').value as String,
          details: element.child('details').value as String,
          location: element.child('location').value as String,
          date: DateTime.parse(element.child('date').value as String),
          points: element.child('points').value as int,
          volunteers: element.child('volunteers').value as int,
          enrolled: element.child('enrolled').value as int,
          users: element.child('users').exists
              ? element.child('users').value as List<Object>
              : [],
        ),
      );
    }
  }

  return result;
}

Future<List<Event>> getUserEvents() async {
  List<Event> result = [];
  final snapshot = await eventsRef.get();
  final userSnapshot = await userRef.child(userId).get();

  String innerID = "";
  if (userSnapshot.exists) {
    innerID = userSnapshot.children.first.key.toString();
  }

  if (snapshot.exists) {
    for (var element in snapshot.children) {
      if (userSnapshot
          .child(innerID)
          .child('events')
          .child(element.key.toString())
          .exists) {
        result.add(
          Event(
            id: element.key as String,
            title: element.child('title').value as String,
            type: element.child('type').value as String,
            img: element.child('img').value as String,
            details: element.child('details').value as String,
            location: element.child('location').value as String,
            date: DateTime.parse(element.child('date').value as String),
            points: element.child('points').value as int,
            volunteers: element.child('volunteers').value as int,
            enrolled: element.child('enrolled').value as int,
            users: element.child('users').exists
                ? element.child('users').value as List<Object>
                : [],
          ),
        );
      }
    }
  }

  return result;
}

void addEvent(Event newEvent) async {
  await eventsRef.push().set(
    {
      "title": newEvent.title,
      "type": newEvent.type,
      "img": newEvent.img,
      "details": newEvent.details,
      "location": newEvent.location,
      "date": newEvent.date.toString(),
      "points": newEvent.points,
      "volunteers": newEvent.volunteers,
      "enrolled": newEvent.enrolled,
      "users": [],
    },
  );
}

void deleteEvents(String id) async {
  await eventsRef.child(id).remove();
}

void registerUser(String eventId) async {
  final snapshot = await userRef.child(userId).get();

  if (snapshot.exists && !snapshot.child('events').child(eventId).exists) {
    final userData = snapshot.children.first;
    await userRef
        .child(userId)
        .child(userData.key.toString())
        .child('events')
        .child(eventId)
        .set(eventId);
  }
}

void registerEvent(String eventId) async {
  final user = await getUser();
  final snapshot = await eventsRef.child(eventId).child('usuarios').get();
  if (snapshot.exists && !snapshot.child(userId).exists) {
    await eventsRef.child(eventId).child('usuarios').child(userId).set(
      {
        "nombre": user.name,
        "apellido": "Perez",
        "img": user.imageP,
      },
    );

    await eventsRef
        .child(eventId)
        .child('enrolled')
        .set(ServerValue.increment(1));
  }
}

Future<List<Registereduser>> getRegisteredUsers(String eventID) async {
  final snapshot = await eventsRef.child(eventID).child('usuarios').get();
  List<Registereduser> result = [];

  if (snapshot.exists) {
    for (var element in snapshot.children) {
      result.add(Registereduser(
          imageP: element.child('img').value.toString(),
          name: element.child('nombre').value.toString(),
          lastName: element.child('apellido').value.toString()));
    }
  }

  return result;
}
