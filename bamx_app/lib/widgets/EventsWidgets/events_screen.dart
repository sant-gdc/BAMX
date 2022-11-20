import 'package:flutter/material.dart';

import './dummy_events.dart';
import './events_list.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  //TODO: Fetch events info from database

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Card(
            color: Colors.red,
            child: Text('Search'),
          ),
          Stack(
            children: [
              EventsList(dummyEvents),
              Positioned.fill(
                bottom: 10,
                right: 20,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.redAccent,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
