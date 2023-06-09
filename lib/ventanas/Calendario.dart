import 'package:flutter/material.dart';
import 'package:aplicacion_mecanico/calendario2.0/agg.dart';
import 'package:aplicacion_mecanico/calendario2.0/eventData_source.dart';
import 'package:aplicacion_mecanico/calendario2.0/event_provider.dart';
import 'package:aplicacion_mecanico/calendario2.0/tasksWidget.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calendario'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 500, child: body(context)),
              SizedBox(
                height: 50,
              ),
              boton(context)
            ],
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

  Widget boton(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AgregarCita()));
            },
            child: Text('Agregar cita')),
      ],
    );
  }
}
