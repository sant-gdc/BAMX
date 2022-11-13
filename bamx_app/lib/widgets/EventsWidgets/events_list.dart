import 'package:flutter/material.dart';
import '../../models/event.dart';
import './event_card.dart';

class EventsList extends StatelessWidget {
  final List<Event> events;

  EventsList(this.events, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return EventCard(
            events[index].img,
            events[index].title,
            events[index].type,
          );
        },
        itemCount: events.length,
      ),
    );
  }
}
