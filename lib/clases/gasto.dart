import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class Gasto extends HiveObject {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String precio = '';

  Gasto({required this.nombre, required this.precio}) {}

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
    };
  }

  @override
  String toString() {
    return 'Gasto{nombre:$nombre,precio:$precio}';
  }
}

class GastoAdapter extends TypeAdapter<Gasto> {
  @override
  Gasto read(BinaryReader reader) {
    return Gasto(nombre: reader.read(), precio: reader.read());
  }

  @override
  // TODO: implement typeId
  int get typeId => 4;

  @override
  void write(BinaryWriter writer, Gasto obj) {
    writer.write(obj.nombre);
    writer.write(obj.precio);
  }
}
