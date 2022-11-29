import 'package:flutter/material.dart';

import '../appBar_widget.dart';
import '../admin_preferences.dart';
import '../admin_widget.dart';

class AdminProfile extends StatefulWidget {
  @override
  AdminProfileState createState() => AdminProfileState();
}

class AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    const admin = AdminPreferences.myAdmin;

    return Scaffold(
      appBar: buildAppBar(context, true),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AdminWidget(
            imageP: admin.imageP,
            vision: admin.vision,
            contacts: admin.contacts,
          )
        ],
      ),
    );
  }
}
