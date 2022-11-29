import 'package:flutter/material.dart';

import '../admin_preferences.dart';
import '../../../models/admin.dart';
import '../profile_pic_edit.dart';
import '../textfield_widget.dart';

class EditAdminPage extends StatefulWidget {
  @override
  EditAdminPageState createState() => EditAdminPageState();
}

class EditAdminPageState extends State<EditAdminPage> {
  Admin admin = AdminPreferences.myAdmin;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('BAMX'),
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfilePicEdit(
              imageP: admin.imageP,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Vision',
              text: admin.vision,
              isAdmin: true,
              onChanged: (vision) {},
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Contactos',
              text: admin.contacts,
              isAdmin: true,
              onChanged: (contacts) {},
            ),
          ],
        ),
      );
}
