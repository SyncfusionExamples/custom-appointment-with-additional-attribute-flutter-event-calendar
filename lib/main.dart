import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const AdditionalAttribute());

class AdditionalAttribute extends StatelessWidget {
  const AdditionalAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdditionalAttribute_Appointment(),
    );
  }
}

class AdditionalAttribute_Appointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppointmentDetails();
}

class AppointmentDetails extends State<AdditionalAttribute_Appointment> {
  String _subjectText='', _startTimeText='', _endTimeText='', _dateText='', _timeDetails='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.week,
            dataSource: getCalendarDataSource(),
            onTap: calendarTapped,
          ),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final Meeting appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.eventName!;
      _dateText = DateFormat('MMMM dd, yyyy')
          .format(appointmentDetails.from!)
          .toString();
      _startTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.from!).toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.to!).toString();
      if (appointmentDetails.isAllDay!) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: Text('$_subjectText')),
              content: Container(
                height: 80,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Id:" + appointmentDetails.id.toString())
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('close'))
              ],
            );
          });
    }
  }

  MeetingDataSource getCalendarDataSource() {
    List<Meeting> appointments = <Meeting>[];
    appointments.add(Meeting(
        from: DateTime.now(),
        to: DateTime.now().add(const Duration(hours: 1)),
        eventName: 'Meeting',
        background: Colors.pink,
        isAllDay: true,
        id: 1));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 4, days: -1)),
        to: DateTime.now().add(const Duration(hours: 5, days: -1)),
        eventName: 'Release Meeting',
        background: Colors.lightBlueAccent,
        id: 2));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 2, days: -2)),
        to: DateTime.now().add(const Duration(hours: 4, days: -2)),
        eventName: 'Performance check',
        background: Colors.amber,
        id: 5));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 6, days: -3)),
        to: DateTime.now().add(const Duration(hours: 7, days: -3)),
        eventName: 'Support',
        background: Colors.green,
        id: 3));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 6, days: 2)),
        to: DateTime.now().add(const Duration(hours: 7, days: 2)),
        eventName: 'Retrospective',
        background: Colors.purple,
        id: 4));

    return MeetingDataSource(appointments);
  }
}

class Meeting {
  Meeting(
      {this.eventName,
        this.from,
        this.to,
        this.background,
        this.isAllDay = false,
        this.id});

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;
  int? id;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}