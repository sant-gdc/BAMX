import 'package:flutter/material.dart';

import './pages/profile_page.dart';
import './pages/admin_page.dart';
import '../../models/user.dart';
import '../../models/admin.dart';
import '../../endpoints/user_api.dart';
import '../../globals.dart';

class PPbubble extends StatefulWidget {
  final bool isAdmin;
  PPbubble(this.isAdmin, {super.key});

  @override
  State<PPbubble> createState() => _PPbubbleState();
}

class _PPbubbleState extends State<PPbubble> {
  User user = const User(
      imageP:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Lost_main_title.svg/1200px-Lost_main_title.svg.png',
      name: 'name',
      lastName: 'lastName',
      age: 'age',
      phone: 'phone',
      points: 0);
  Admin admin = const Admin(
      imageP:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Lost_main_title.svg/1200px-Lost_main_title.svg.png',
      vision: 'vision',
      contacts: 'contacts');

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _changeUser(User changedUser, User user) async {
    changeUser(changedUser, user);
    fetchData();
  }

  void _changeAdmin(Admin changedAdmin, Admin admin) async {
    changeAdmin(changedAdmin, admin);
    fetchData();
  }

  void fetchData() async {
    if (!mounted) {
      return;
    }

    final String type = await getType();

    if (type == 'A') {
      final Admin adminGet = await getAdmin();
      setState(() {
        admin = adminGet;
      });
    } else {
      final User userInfo = await getUser();
      setState(() {
        user = userInfo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            fetchData();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => widget.isAdmin
                    ? AdminProfile(admin: admin, changeAdmin: _changeAdmin)
                    : ProfilePage(user: user, changeUser: _changeUser)));
          },
          child: Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                  image: widget.isAdmin
                      ? NetworkImage(admin.imageP)
                      : NetworkImage(user.imageP),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
