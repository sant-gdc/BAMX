import 'package:flutter/material.dart';

import '../../endpoints/events_api.dart';

class ConfirmAlert extends StatelessWidget {
  final String header;
  final String message;
  final String eventID;
  const ConfirmAlert(this.header, this.message, this.eventID, {super.key});

  void sendUserInfo(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    try {
      registerUser(eventID);
      registerEvent(eventID);
      messenger.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: StadiumBorder(),
          margin: EdgeInsets.all(50),
          content: Text('Registro Exitoso'),
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      messenger.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: StadiumBorder(),
          margin: EdgeInsets.all(50),
          content: Text('No se pudo hacer el Registro o ya está registrado'),
        ),
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text(header),
      content: Text(message),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      contentTextStyle: Theme.of(context).textTheme.bodyMedium,
      actionsPadding: const EdgeInsets.only(
        bottom: 20,
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () => sendUserInfo(context),
          child: const Text('Aceptar'),
        )
      ],
    );
  }
}
