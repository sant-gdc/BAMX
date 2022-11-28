import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

import '../EventsWidgets/dummy_events.dart';
import '../../models/event.dart';

class Calendar_Screen extends StatefulWidget {
  const Calendar_Screen({super.key});

  @override
  State<Calendar_Screen> createState() => _Calendar_ScreenState();
}

class _Calendar_ScreenState extends State<Calendar_Screen> {
  late List<Event> _eventList = dummyEvents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 1,
        dataSource: EventDataSource(getAppointments(_eventList)),
        cellBorderColor: Colors.transparent,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: true,
          agendaStyle: AgendaStyle(
            backgroundColor: Color.fromARGB(235, 255, 237, 237),
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
            borderRadius: BorderRadius.all(Radius.circular(4)),
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
        subject: eventList[key].title,
        isAllDay: false,
        color: Colors.red));
  });
  eventos.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Colecta de Comida',
      isAllDay: true,
      color: Colors.red));

  return eventos;
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> source) {
    appointments = source;
  }
}
