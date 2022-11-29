import 'package:flutter/material.dart';

import './carrousel.dart';

class ProgramLong extends StatelessWidget {
  final String title;
  final String image;
  final String type;
  final String details;
  final String contact;
  final bool admin;
  final Function deleteProgram;
  final int id;

  const ProgramLong({
    super.key,
    required this.details,
    required this.contact,
    required this.title,
    required this.image,
    required this.type,
    required this.admin,
    required this.id,
    required this.deleteProgram,
  });

  void deleteData(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Eliminar Programa'),
            content: const Text('¿Segur@ de eliminar este programa?'),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: () {
                  deleteProgram(id);
                  //close alert and modal
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(15), topEnd: Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      textAlign: TextAlign.start,
                    ),
                    admin
                        ? TextButton(
                            onPressed: () {
                              deleteData(context);
                            },
                            child: Icon(
                                color: Theme.of(context).colorScheme.primary,
                                Icons.delete),
                          )
                        : const Icon(
                            Icons.notifications_none,
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.info_outline,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          details.length > 110
                              ? '${details.substring(0, 110)}...'
                              : details,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.phone,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        contact,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 27),
                  child: Text(
                    "Próximos eventos...",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Carrousel(
          type: type,
        )),
      ],
    );
  }
}
