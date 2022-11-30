import 'package:firebase_database/firebase_database.dart';

import '../models/event.dart';

DatabaseReference eventsRef = FirebaseDatabase.instance.ref('Events');
//TODO: Fix rerendering bug
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

void deletePrograms(String id) async {
  await eventsRef.child(id).remove();
}
