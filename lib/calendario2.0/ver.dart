import 'package:flutter/material.dart';
import 'package:aplicacion_mecanico/calendario2.0/agg.dart';
import 'package:aplicacion_mecanico/calendario2.0/eventData_source.dart';
import 'package:aplicacion_mecanico/calendario2.0/event_provider.dart';
import 'package:aplicacion_mecanico/calendario2.0/tasksWidget.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendariop extends StatelessWidget {
  const Calendariop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calendario'),
        ),
        body: body(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AgregarCita()));
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ));
  }

  Widget body(BuildContext context) {
    final events = Provider.of<EventProvider>(context).eventos;

    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(details.date!);

        showModalBottomSheet(
          context: context,
          builder: (context) => TasksWidget(),
        );
      },
    );
  }
}
