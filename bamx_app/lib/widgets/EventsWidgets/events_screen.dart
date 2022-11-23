import 'package:flutter/material.dart';

import './add_event_form.dart';
import './dummy_events.dart';
import './events_list.dart';

class EventScreen extends StatelessWidget {
  final bool admin;

  const EventScreen(this.admin, {super.key});
  //TODO: Fetch events info from database

  void createEVent(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: const AddEventForm(
            isEvento: true,
          ),
        );
      },
    );
  }

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
                bottom: MediaQuery.of(context).size.height * 0.021,
                right: 20,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: admin
                      ? FloatingActionButton(
                          onPressed: () => createEVent(context),
                          backgroundColor: Colors.redAccent,
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ))
                      : const Text(''),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
