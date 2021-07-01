import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarioScreen extends StatefulWidget {
  CalendarioScreen({Key? key}) : super(key: key);

  @override
  _CalendarioScreenState createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends State<CalendarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApps.backPrimaryColorApp,
        title: Text('Calendario'),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 6,
        dataSource: MeetingDAtaSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime satartTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = satartTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: satartTime,
      endTime: endTime,
      subject: 'Evento',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=10'));

  return meetings;
}

class MeetingDAtaSource extends CalendarDataSource {
  MeetingDAtaSource(List<Appointment> source) {
    appointments = source;
  }
}
