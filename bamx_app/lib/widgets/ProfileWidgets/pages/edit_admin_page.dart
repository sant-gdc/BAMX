import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/admin.dart';
import '../profile_pic_edit.dart';
import '../../../endpoints/user_api.dart';

class EditAdminPage extends StatefulWidget {
  final String imageP;
  final String vision;
  final String contacts;
  final Admin admin;

  const EditAdminPage({
    super.key,
    required this.imageP,
    required this.vision,
    required this.contacts,
    required this.admin,
  });

  @override
  EditAdminPageState createState() => EditAdminPageState();
}

class EditAdminPageState extends State<EditAdminPage> {
  final _visionController = TextEditingController();
  final _contactsController = TextEditingController();

  void initState() {
    _visionController.text = widget.admin.vision;
    _contactsController.text = widget.admin.contacts;

    super.initState();
  }

  Admin modifyAdmin() {
    Admin changedAdmin = Admin(
        imageP: '',
        vision: _visionController.text,
        contacts: _contactsController.text);

    return changedAdmin;
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
              imageP: widget.admin.imageP,
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Vision',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _visionController,
                  maxLines: 5,
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
                const Text('Contactos',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _contactsController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: (() {
                  changeAdmin(modifyAdmin(), widget.admin);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                            title: const Text(
                              '¡Cambiaste tus datos!',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Aceptar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ));
                }),
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
}
