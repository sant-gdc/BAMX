import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        //height: 200,
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
                            Text(event.location),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            Text(
                              DateFormat.yMMMMEEEEd()
                                  .add_jm()
                                  .format(event.date),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.notes),
                            Text(event.details),
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
                  child: ElevatedButton(
                    onPressed: () {},
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
