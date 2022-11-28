import 'package:flutter/material.dart';

import '../../models/volunteer.dart';

class VolunteerList extends StatelessWidget {
  final List<Volunteer> events;

  VolunteerList(this.events);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 75,
                  height: 75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(events[index].image),
                        fit: BoxFit.fill),
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
                      //DateFormat.yMMMd().format(events[index].date),
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
          );
        },
        itemCount: events.length,
      ),
    );
  }
}
