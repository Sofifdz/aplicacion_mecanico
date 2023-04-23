import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendar_ extends StatefulWidget {
  const TableCalendar_({super.key});

  @override
  State<TableCalendar_> createState() => TableCalendarState_();
}

class TableCalendarState_ extends State<TableCalendar_> {
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List> _events = {};

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(2021),
      lastDay: DateTime(2025),
      focusedDay: _selectedDay,
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
      },
      eventLoader: (day) {
        return _events[day] ?? [];
      },
    );
  }
}
