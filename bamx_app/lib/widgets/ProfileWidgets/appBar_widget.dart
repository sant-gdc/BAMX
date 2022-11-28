import 'package:flutter/material.dart';

import './pages/edit_profile_page.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: const BackButton(),
    title: const Text('BAMX'),
    backgroundColor: Colors.red,
    elevation: 0,
    actions: <Widget>[
      IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()));
          },
          icon: const Icon(Icons.settings)),
    ],
  );
}
