import 'package:flutter/material.dart';
import 'package:aplicacion_mecanico/calendario2.0/evento.dart';

class EventProvider extends ChangeNotifier {
  final List<Evento> _events = [];

  List<Evento> get eventos => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Evento> get eventsOfSelectedDate => _events;

  void addEvent(Evento evento) {
    _events.add(evento);
    notifyListeners();
  }

  void editEvent(Evento nuevoEvento, Evento oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = nuevoEvento;

    notifyListeners();
  }
}
