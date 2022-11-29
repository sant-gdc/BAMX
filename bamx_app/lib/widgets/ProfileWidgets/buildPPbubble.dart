import 'package:flutter/material.dart';

import './pages/profile_page.dart';
import './pages/admin_page.dart';
import './user_preferences.dart';
import './admin_preferences.dart';

Widget buildPPbubble(BuildContext context, bool userType) {
  const user = UserPreferences.myUser;
  const admin = AdminPreferences.myAdmin;

  final imageU = NetworkImage(user.imageP);
  final imageA = NetworkImage(admin.imageP);

  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => userType ? AdminProfile() : ProfilePage()));
        },
        child: Container(
          width: 45,
          height: 45,
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
                image: userType ? imageA : imageU, fit: BoxFit.fill),
          ),
        ),
      ),
    ],
  );
}
