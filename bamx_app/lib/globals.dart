import 'package:firebase_auth/firebase_auth.dart';

bool isAdmin = false;
String userId = FirebaseAuth.instance.currentUser!.uid;
