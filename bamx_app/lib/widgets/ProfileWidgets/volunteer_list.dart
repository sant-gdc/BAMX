import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';

class VolunteerList extends StatelessWidget {
  final List<Event> events;

  final imageP = const NetworkImage(
      'https://bamx.org.mx/wp-content/plugins/Agile/public/Logo/5e8827daba0aa_logo.png');

  VolunteerList(this.events);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => buildEventInfo(index));
            },
            child: Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageP,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        events[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${events[index].points.toString()} puntos',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: events.length,
      ),
    );
  }

  Widget buildEventInfo(index) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 40,
      title: Text(
        events[index].title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.red,
        ),
      ),
      children: <Widget>[
        const Divider(
          color: Colors.red,
          thickness: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${DateFormat.MMMEd().format(events[index].date)} \t - \t'),
            Text(
              '${events[index].points.toString()} pts',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detalles:',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Text(
                events[index].details,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              Row(
                children: const <Widget>[
                  Text(
                    'Ubicación:',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Categoría:',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    events[index].location,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    events[index].type,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
