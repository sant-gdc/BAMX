import 'package:firebase_database/firebase_database.dart';
import '../globals.dart';

import '../models/user.dart';
import '../models/admin.dart';

DatabaseReference userRef = FirebaseDatabase.instance.ref('Users');
DatabaseReference adminRef = FirebaseDatabase.instance.ref('Admins');

Future<User> getUser() async {
  User user = const User(
      imageP: '', name: '', lastName: '', age: '', phone: '', points: 0);

  final snapshot = await userRef.child(userId).get();
  if (snapshot.exists) {
    final info = snapshot.children.first;
    if (info.child('user').value == 'U') {
      user = User(
          imageP:
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
          name: info.child('name').value as String,
          lastName: info.child('lastName').value as String,
          age: info.child('age').value as String,
          phone: info.child('phone').value as String,
          points: info.child('points').value as int);
    }
  }

  return user;
}

void changeUser(User changedUser, User user) async {
  final snapshot = await userRef.child(userId).get();
  if (snapshot.exists) {
    final info = snapshot.children.first;
    if (info.child('user').value == 'U') {
      await userRef.child(userId).child(info.key.toString()).update({
        "image": user.imageP,
        "name": changedUser.name,
        "lastName": changedUser.lastName,
        "age": changedUser.age,
        "phone": changedUser.phone,
        "points": user.points,
      });
    }
  }
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

void changeAdmin(Admin changedAdmin, Admin admin) async {
  final snapshot = await adminRef.child(userId).get();
  if (snapshot.exists) {
    final info = snapshot.children.first;
    if (info.child('user').value == 'A') {
      await userRef.child(userId).child(info.key.toString()).update({
        "image": admin.imageP,
        "vision": changedAdmin.imageP,
        "contacts": changedAdmin.contacts,
      });
    }
  }
}
