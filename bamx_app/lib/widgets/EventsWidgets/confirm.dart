import 'package:flutter/material.dart';

class ConfirmAlert extends StatelessWidget {
  final String header;
  final String message;
  const ConfirmAlert(this.header, this.message, {super.key});

  void sendUserInfo(BuildContext context) {
    //TODO: pending send register information
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
