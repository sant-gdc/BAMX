import 'package:firebase_database/firebase_database.dart';

import '../models/programs.dart';
import '../models/event.dart';

DatabaseReference programsRef = FirebaseDatabase.instance.ref('Programs');
DatabaseReference eventsRef = FirebaseDatabase.instance.ref('Events');

Future<List<Program>> getPrograms() async {
  List<Program> programs = [];

  final snapshot = await programsRef.get();
  if (snapshot.exists) {
    for (var element in snapshot.children) {
      programs.add(Program(
        id: element.key as String,
        title: element.child('title').value as String,
        image: element.child('image').value as String,
        type: element.child('type').value as String,
        details: element.child('details').value as String,
        contact: element.child('contact').value as String,
      ));
    }
  }

  return programs;
}

void addProgram(Program newProgram) async {
  await programsRef.push().set({
    "contact": newProgram.contact,
    "details": newProgram.details,
    "image": newProgram.image,
    "title": newProgram.title,
    "type": newProgram.type,
  });
}

void deletePrograms(String id) async {
  await programsRef.child(id).remove();
}

Future<List<Event>> getRelatedEvents(String searchType) async {
  List<Event> result = [];
  final snapshot = await eventsRef.get();
  if (snapshot.exists) {
    for (var element in snapshot.children) {
      if (element.child('type').value as String == searchType) {
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
