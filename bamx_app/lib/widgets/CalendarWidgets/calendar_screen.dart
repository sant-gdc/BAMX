import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

import '../../endpoints/events_api.dart';

import '../../models/event.dart';

import '../../globals.dart';

class Calendar_Screen extends StatefulWidget {
  const Calendar_Screen({super.key});

  @override
  State<Calendar_Screen> createState() => _Calendar_ScreenState();
}

class _Calendar_ScreenState extends State<Calendar_Screen> {
  List<Event> _eventList = [];

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  void _fetchEvents() async {
    List<Event> newList = [];
    if (isAdmin) {
      newList = await getEvents();
    } else {
      newList = await getUserEvents();
    }
    setState(() {
      _eventList = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .79,
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      margin: const EdgeInsets.all(10),
      child: SfCalendar(
        headerStyle: CalendarHeaderStyle(
            textStyle: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center),
        view: CalendarView.month,
        firstDayOfWeek: 1,
        dataSource: EventDataSource(getAppointments(_eventList)),
        cellBorderColor: Colors.transparent,
        showNavigationArrow: true,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: true,
          agendaStyle: AgendaStyle(
            appointmentTextStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(239, 255, 255, 255)),
            dateTextStyle: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 0, 0, 0)),
            dayTextStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: Colors.red, width: 2),
            shape: BoxShape.rectangle),
      ),
    );
  }
}

List<Appointment> getAppointments(List<Event> eventList) {
  List<Appointment> eventos = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  eventList.asMap().forEach((key, value) {
    eventos.add(Appointment(
        startTime: eventList[key].date,
        endTime: eventList[key].date.add(const Duration(hours: 1)),
        subject: '${eventList[key].title} en ${eventList[key].location}',
        isAllDay: false,
        color: Colors.red));
  });

  return eventos;
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> source) {
    appointments = source;
  }
}
