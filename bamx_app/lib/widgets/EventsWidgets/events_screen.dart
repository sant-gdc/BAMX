import 'package:flutter/material.dart';
import '../../models/event.dart';

import './add_event_form.dart';
import './dummy_events.dart';
import './events_list.dart';

class EventScreen extends StatefulWidget {
  final bool admin;

  const EventScreen(this.admin, {super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final _searchQuery = TextEditingController();
  late List<Event> _eventList;

  @override
  void initState() {
    super.initState();

    _eventList = dummyEvents;
  }

  //TODO: Fetch events info from database
  void _createEVent(BuildContext context) {
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

  void _searchEvent(String query) {
    final resultEvents = _eventList.where((event) {
      final eventTitle = event.title.toLowerCase();
      final input = query.toLowerCase();
      return eventTitle.contains(input);
    }).toList();

    if (query.isEmpty) {
      setState(() => _eventList = dummyEvents);
      _searchQuery.clear();
    } else {
      setState(() => _eventList = resultEvents);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              color: Colors.red,
              child: Text('Search'),
            ),
            Stack(
              children: [
                EventsList(dummyEvents),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: widget.admin
          ? FloatingActionButton(
              onPressed: () => _createEVent(context),
              backgroundColor: Colors.redAccent,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ))
          : const Text(''),
    );
  }
}
