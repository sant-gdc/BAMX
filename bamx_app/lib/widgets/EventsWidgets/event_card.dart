import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';

import './volunteer_list.dart';
import 'confirm.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Function delete;
  final bool isAdmin;

  const EventCard(this.event, this.delete, this.isAdmin, {super.key});

  void confirmRegister(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmAlert(
          'Confirmar Registro',
          '¿Segur@ que desea registrarse en ese evento?',
          event.id,
        );
      },
    );
  }

  void confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Borrar evento'),
          content: const Text('¿Está segur@ de borrar este evento?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
            ElevatedButton(
              onPressed: () {
                delete(
                  event.id,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 12,
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            //Image Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .13,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(25),
                  topEnd: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: NetworkImage(event.img),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ExpansionTile(
              title: Text(event.title),
              subtitle: Text(event.type),
              leading: const Icon(Icons.archive, size: 50),
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.pin_drop),
                            Expanded(
                              child: Text(event.location),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            Expanded(
                              child: Text(
                                DateFormat.yMMMMEEEEd()
                                    .add_jm()
                                    .format(event.date),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.notes),
                            Expanded(
                              child: Text(event.details),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.star_border_rounded),
                            const Text('Esta actividad otorga'),
                            Text(
                              ' ${event.points.toString()} Servicoins',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                            'Voluntarios: ${event.enrolled}/${event.volunteers}'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15),
                  child: isAdmin
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .55,
                              child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (_) {
                                      return GestureDetector(
                                          onTap: () {},
                                          behavior: HitTestBehavior.opaque,
                                          child: VolunteerList(event.id));
                                    },
                                  );
                                },
                                child: const Icon(Icons.person),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .20,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.grey.shade800),
                                ),
                                onPressed: () => confirmDelete(context),
                                child: const Icon(Icons.delete_outline),
                              ),
                            ),
                          ],
                        )
                      : ElevatedButton(
                          onPressed: () => confirmRegister(context),
                          child: const Text('Registrate'),
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
