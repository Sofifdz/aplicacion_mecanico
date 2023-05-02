import 'package:flutter/material.dart';
import 'package:aplicacion_mecanico/calendario2.0/EventEditing.dart';
import 'package:aplicacion_mecanico/calendario2.0/eventData_source.dart';
import 'package:aplicacion_mecanico/calendario2.0/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
          child: Text(
        'No hay Eventos',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ));
    }

    return SfCalendarTheme(
      data: SfCalendarThemeData(
          timeTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
      )),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.eventos),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        todayHighlightColor: Colors.black,
        headerHeight: 0,
        selectionDecoration: BoxDecoration(color: Colors.red.withOpacity(0.3)),
        onTap: (details) {
          if (details.appointments == null) return;

          final event = details.appointments!.first;

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventEditingPage(evento: event)));
        },
      ),
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: event.brackound.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.titulo,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
