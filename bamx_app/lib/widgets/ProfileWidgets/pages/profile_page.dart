import 'package:bamx_app/widgets/ProfileWidgets/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../profile_widget.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  final Function changeUser;
  const ProfilePage({super.key, required this.user, required this.changeUser});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                          name: widget.user.name,
                          lastName: widget.user.lastName,
                          age: widget.user.age,
                          phone: widget.user.phone,
                          imageP: widget.user.imageP,
                          changeUser: widget.changeUser,
                          user: widget.user,
                        )));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imageP: widget.user.imageP,
            name: widget.user.name,
            lastName: widget.user.lastName,
            age: widget.user.age,
            phone: widget.user.phone,
            points: widget.user.points,
          )
        ],
      ),
    );
  }
}
