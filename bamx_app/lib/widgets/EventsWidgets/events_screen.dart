import 'package:flutter/material.dart';

import './dummy_events.dart';
import './events_list.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: Colors.red,
            child: Text('Search'),
          ),
          EventsList(dummyEvents),
        ],
      ),
    );
    /*const EventCard(
      'https://www.centronia.org/2016/wp-content/uploads/2016/11/DSCF7782-580x345.jpg?e7ce06&e7ce06',
      'Colecta de Ropa',
      'Colecta',
    );*/
  }
}
