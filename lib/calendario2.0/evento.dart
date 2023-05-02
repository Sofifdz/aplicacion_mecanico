import 'package:flutter/material.dart';

class Evento {
  final String titulo;
  final String descripcion;
  final DateTime to;
  final DateTime from;
  final Color brackound;
  final bool isallday;

  const Evento({
    required this.titulo,
    required this.descripcion,
    required this.to,
    required this.from,
    this.brackound = Colors.grey,
    this.isallday = false,
  });
}
