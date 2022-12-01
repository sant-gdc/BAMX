import 'package:flutter/material.dart';

import '../admin_preferences.dart';
import '../admin_widget.dart';
import '../../../endpoints/user_api.dart';
import '../../../models/admin.dart';
import './edit_profile_page.dart';
import './edit_admin_page.dart';

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
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('BAMX'),
        backgroundColor: Colors.red,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditAdminPage()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
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
