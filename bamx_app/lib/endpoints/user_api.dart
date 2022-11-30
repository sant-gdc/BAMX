import 'package:firebase_database/firebase_database.dart';
import '../globals.dart';

import '../models/user.dart';
import '../models/admin.dart';

DatabaseReference userRef = FirebaseDatabase.instance.ref('Users');
DatabaseReference adminRef = FirebaseDatabase.instance.ref('Admins');

Future<User> getUser() async {
  User user = const User(imageP: '', name: '', age: '', phone: '', points: 0);

  final snapshot = await userRef.child(userId).get();
  if (snapshot.exists) {
    final info = snapshot.children.first;
    if (info.child('user').value == 'U') {
      user = User(
          imageP:
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
          name: info.child('name').value as String,
          age: info.child('age').value as String,
          phone: info.child('phone').value as String,
          points: info.child('points').value as int);
    }
  }

  return user;
}

Future<Admin> getAdmin() async {
  Admin admin =
      const Admin(imageP: 'imageP', vision: 'vision', contacts: 'contacts');

  final snapshot = await adminRef.child(userId).get();
  if (snapshot.exists) {
    final info = snapshot.children.first;
    if (info.child('user').value == 'A') {
      admin = Admin(
          imageP: 'assets/images/bamx_logo.png',
          vision: info.child('vision').value as String,
          contacts: info.child('contacts').value as String);
    }
  }

  return admin;
}
