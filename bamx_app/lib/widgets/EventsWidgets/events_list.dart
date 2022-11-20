import 'package:flutter/material.dart';
import '../../models/event.dart';
import './event_card.dart';

class EventsList extends StatelessWidget {
  final List<Event> events;

  const EventsList(this.events, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * .75,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return EventCard(events[index]);
        },
        itemCount: events.length,
      ),
    );
  }
}
