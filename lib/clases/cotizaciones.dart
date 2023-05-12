import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 5)
class Cotizacion extends HiveObject {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String precio = '';
  @HiveField(2)
  String cantidad = '';

  Cotizacion(
      {required this.nombre, required this.precio, required this.cantidad}) {}

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'cantidad': cantidad,
    };
  }

  @override
  String toString() {
    return 'Cotizacion{nombre:$nombre,precio:$precio,cantidad:$cantidad}';
  }
}

class CotizacionAdapter extends TypeAdapter<Cotizacion> {
  @override
  Cotizacion read(BinaryReader reader) {
    return Cotizacion(
        nombre: reader.read(), precio: reader.read(), cantidad: reader.read());
  }

  @override
  // TODO: implement typeId
  int get typeId => 5;

  @override
  void write(BinaryWriter writer, Cotizacion obj) {
    writer.write(obj.nombre);
    writer.write(obj.precio);
    writer.write(obj.cantidad);
  }
}
