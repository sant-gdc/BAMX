import 'package:flutter/material.dart';
import '../../models/event.dart';
import './event_card.dart';

class EventsList extends StatelessWidget {
  final List<Event> events;
  final bool isAdmin;
  final Function deleteEvent;

  const EventsList(this.events, this.isAdmin, this.deleteEvent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * .7,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return EventCard(
            events[index],
            deleteEvent,
            isAdmin,
          );
        },
        itemCount: events.length,
      ),
    );
  }
}
