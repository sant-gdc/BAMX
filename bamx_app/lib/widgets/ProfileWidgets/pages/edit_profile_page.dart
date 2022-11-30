import 'package:flutter/material.dart';

import '../user_preferences.dart';
import '../../../models/user.dart';
import '../profile_pic_edit.dart';
import '../textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

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
              imageP: user.imageP,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Nombre completo',
              text: user.name,
              isAdmin: false,
              onChanged: (name) {},
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Edad',
              text: user.age,
              isAdmin: false,
              onChanged: (age) {},
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Número de teléfono',
              text: user.phone,
              isAdmin: false,
              onChanged: (phone) {},
            ),
          ],
        ),
      );
}
