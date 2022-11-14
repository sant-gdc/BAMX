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
          const Card(
            color: Colors.red,
            child: Text('Search'),
          ),
          EventsList(dummyEvents),
        ],
      ),
    );
  }
}
