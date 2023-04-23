import 'package:aplicacion_mecanico/componentes/TableCalendar.dart';
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
      body: Column(
        children: [
          TableCalendar_(),
          SizedBox(
            height: 100,
          ),
          botonagregar(context)
        ],
      ),
    );
  }

  @override
  // TODO: implement widget
  Widget botonagregar(BuildContext context) {
    return Row();
  }
}
