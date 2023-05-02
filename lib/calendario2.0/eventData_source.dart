import 'package:flutter/material.dart';
import 'package:aplicacion_mecanico/calendario2.0/evento.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Evento> appointments) {
    this.appointments = appointments;
  }

  Evento getEvent(int index) => appointments![index] as Evento;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).titulo;

  @override
  Color getColor(int index) => getEvent(index).brackound;

  @override
  bool isallDay(int index) => getEvent(index).isallday;
}
