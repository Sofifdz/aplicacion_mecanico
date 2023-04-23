import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Calendario'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: TableCalendar(
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
        ),
      ),
    );
  }
}
