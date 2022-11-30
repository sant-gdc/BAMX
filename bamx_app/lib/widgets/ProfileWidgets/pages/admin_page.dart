import 'package:flutter/material.dart';

import '../appBar_widget.dart';
import '../admin_preferences.dart';
import '../admin_widget.dart';
import '../../../endpoints/user_api.dart';
import '../../../models/admin.dart';

class AdminProfile extends StatefulWidget {
  final Admin admin;
  const AdminProfile(this.admin, {super.key});

  @override
  AdminProfileState createState() => AdminProfileState();
}

class AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    //const admin = AdminPreferences.myAdmin;

    return Scaffold(
      appBar: buildAppBar(context, true),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AdminWidget(
            imageP: widget.admin.imageP,
            vision: widget.admin.vision,
            contacts: widget.admin.contacts,
          )
        ],
      ),
    );
  }
}
