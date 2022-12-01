import 'package:flutter/material.dart';

import '../admin_widget.dart';
import '../../../models/admin.dart';
import './edit_admin_page.dart';

class AdminProfile extends StatefulWidget {
  final Admin admin;
  final Function changeAdmin;

  const AdminProfile({required this.admin, required this.changeAdmin, super.key});

  @override
  AdminProfileState createState() => AdminProfileState();
}

class AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {

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
                    MaterialPageRoute(builder: (context) => EditAdminPage(
                      imageP: widget.admin.imageP,
                      vision: widget.admin.vision,
                      contacts: widget.admin.contacts,
                      admin: widget.admin,
                    )));
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
