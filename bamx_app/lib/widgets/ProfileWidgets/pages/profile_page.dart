import 'package:flutter/material.dart';

import '../appBar_widget.dart';
import '../user_preferences.dart';
import '../profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imageP: user.imageP,
            name: user.name,
            age: user.age,
            phone: user.phone,
            points: user.points,
          )
        ],
      ),
    );
  }
}
