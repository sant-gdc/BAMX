import 'package:flutter/material.dart';

import '../appBar_widget.dart';
import '../user_preferences.dart';
import '../../../endpoints/user_api.dart';
import '../../../models/user.dart';
import '../profile_widget.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage(this.user, {super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //late User _userInfo = const User(imageP: 'imageP', name: 'name', age: 'age', phone: 'phone', points: 0);

  @override
  // void initState() {
  //   super.initState();
  //   _fecthData();
  // }

  // void _fecthData() async {
  //   final User user = await getUser();
  //   setState(() => _userInfo = user);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, false),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imageP: widget.user.imageP,
            name: widget.user.name,
            age: widget.user.age,
            phone: widget.user.phone,
            points: widget.user.points,
          )
        ],
      ),
    );
  }
}
