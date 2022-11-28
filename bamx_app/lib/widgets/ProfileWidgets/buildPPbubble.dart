import 'package:flutter/material.dart';

import './pages/profile_page.dart';
import './user_preferences.dart';

Widget buildPPbubble(BuildContext context) {
  const user = UserPreferences.myUser;

  final image = NetworkImage(user.imageP);

  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: Container(
          width: 45,
          height: 45,
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            image: DecorationImage(image: image, fit: BoxFit.fill),
          ),
        ),
      ),
    ],
  );
}
