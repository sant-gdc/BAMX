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
  late List<Event> _eventFilter;

  @override
  void initState() {
    super.initState();

    _eventList = dummyEvents;
    _eventFilter = dummyEvents;
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
      setState(() => _eventFilter = dummyEvents);
      _searchQuery.clear();
    } else {
      setState(() => _eventFilter = resultEvents);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 0,
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              width: double.infinity,
              child: TextField(
                onChanged: (text) {
                  _searchEvent(_searchQuery.text);
                },
                controller: _searchQuery,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  icon: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Icon(Icons.search)),
                  border: InputBorder.none,
                ),
              ),
            ),
            Stack(
              children: [
                _eventFilter.isEmpty
                    ? Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height * .7,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'No se encontraron eventos',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 50),
                            Container(
                              height: 200,
                              child: Image.asset(
                                'assets/images/waiting.png',
                                //fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )
                    : EventsList(_eventFilter),
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
