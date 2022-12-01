import 'package:bamx_app/endpoints/user_api.dart';
import 'package:flutter/material.dart';

import '../user_preferences.dart';
import '../../../models/user.dart';
import '../profile_pic_edit.dart';
import '../textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  final String imageP;
  final String name;
  final String lastName;
  final String age;
  final String phone;
  final Function changeUser;
  final User user;

  const EditProfilePage(
      {super.key,
      required this.name,
      required this.lastName,
      required this.age,
      required this.phone,
      required this.imageP,
      required this.changeUser,
      required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();

  User modifyUser() {
    User changedUser = User(
        imageP: '',
        name: _nameController.text,
        lastName: _lastNameController.text,
        age: _ageController.text,
        phone: _phoneController.text,
        points: 0);

    return changedUser;
  }

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
              imageP: widget.imageP,
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nombre',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Apellidos',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Edad',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Número de Telefono',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (() => changeUser(modifyUser(), widget.user)),
                child: Text(
                  'Crear Nuevo',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      );
}
