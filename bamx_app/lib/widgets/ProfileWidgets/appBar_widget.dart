import 'package:flutter/material.dart';

import './pages/edit_profile_page.dart';
import './pages/edit_admin_page.dart';

AppBar buildAppBar(BuildContext context, bool userType) {
  return AppBar(
    leading: const BackButton(),
    title: const Text('BAMX'),
    backgroundColor: Colors.red,
    elevation: 0,
    actions: <Widget>[
      IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    userType ? EditAdminPage() : EditProfilePage()));
          },
          icon: const Icon(Icons.settings)),
    ],
  );
}
