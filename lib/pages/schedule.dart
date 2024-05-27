import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  //final List<DateTime> specialDays;

  //SchedulePage({this.specialDays = const []});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> _specialDays = [
    DateTime(2024, 5, 27),
    DateTime(2024, 5, 28),
    DateTime(2024, 5, 29),
    DateTime(2024, 6, 3),
    DateTime(2024, 6, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay:
              DateTime.utc(DateTime.now().year, DateTime.now().month - 1, 1),
          lastDay:
              DateTime.utc(DateTime.now().year, DateTime.now().month + 2, 0),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (_specialDays
                  .any((specialDay) => isSameDay(specialDay, date))) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[800],
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.all(4.0),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '${date.day}',
                    style: TextStyle().copyWith(color: Colors.white),
                  ),
                );
              }
              return null;
            },
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
      ],
    );
  }
}
