import 'package:aplicacion_mecanico/clases/claseVehiculo.dart';
import 'package:aplicacion_mecanico/clases/cotizaciones.dart';
import 'package:aplicacion_mecanico/clases/gasto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'cliente.dart';

@HiveType(typeId: 2)
class Servicios extends HiveObject {
  @HiveField(0)
  List<Cliente> clientess;
  @HiveField(1)
  List<Vehiculo> vehiculoss;
  @HiveField(2)
  List<Gasto> gastos;
  @HiveField(3)
  List<Cotizacion> cotizaciones;

  Servicios({
    required this.clientess,
    required this.vehiculoss,
    required this.gastos,
    required this.cotizaciones,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'clientess': clientess,
      'vehiculoss': vehiculoss,
      'gastos': gastos,
      'cotizaciones': cotizaciones,
    };
  }

  @override
  String toString() {
    return 'Servicio{clientess: $clientess, vehiculoss: $vehiculoss,gastos:$gastos,cotizaciones:$cotizaciones}';
  }
}

class ServiciosAdapter extends TypeAdapter<Servicios> {
  @override
  Servicios read(BinaryReader reader) {
    return Servicios(
      clientess: List<Cliente>.from(reader.read()),
      vehiculoss: List<Vehiculo>.from(reader.read()),
      gastos: List<Gasto>.from(reader.read()),
      cotizaciones: List<Cotizacion>.from(reader.read()),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, Servicios obj) {
    writer.write(obj.clientess);
    writer.write(obj.vehiculoss);
    writer.write(obj.gastos);
    writer.write(obj.cotizaciones);
  }
}
