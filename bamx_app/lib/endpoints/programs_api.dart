import 'package:firebase_database/firebase_database.dart';

import '../globals.dart';
import '../models/programs.dart';
import '../models/event.dart';
import '../firebase_options.dart';

DatabaseReference programsRef = FirebaseDatabase.instance.ref('Programs');

void getPrograms() async {
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
}

void addProgram() {}

void deletePrograms() {}

void getRelatedEvents() {}
