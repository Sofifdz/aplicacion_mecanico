import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

@HiveType(typeId: 1)
class Vehiculo extends HiveObject {
  @HiveField(0)
  String marca;
  @HiveField(1)
  String modelo;
  @HiveField(2)
  String anio;
  @HiveField(3)
  String motor;
  @HiveField(4)
  String color;
  @HiveField(5)
  String vn;
  @HiveField(6)
  String kms;
  @HiveField(7)
  String placas;
  @HiveField(8)
  String fecha;

  Vehiculo({
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.motor,
    required this.color,
    required this.vn,
    required this.kms,
    required this.placas,
    required this.fecha,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'modelo': modelo,
      'anio': anio,
      'motor': motor,
      'color': color,
      'vn': vn,
      'kms': kms,
      'placas': placas,
      'fecha': fecha,
    };
  }

  @override
  String toString() {
    return 'Vehiculo{ marca: $marca, modelo: $modelo,anio: $anio,motor:$motor, color: $color,vn: $vn,kms: $kms,placas: $placas,fecha: $fecha}';
  }
}

class VehiculoAdapter extends TypeAdapter<Vehiculo> {
  @override
  Vehiculo read(BinaryReader reader) {
    return Vehiculo(
      marca: reader.read(),
      modelo: reader.read(),
      anio: reader.read(),
      motor: reader.read(),
      color: reader.read(),
      vn: reader.read(),
      kms: reader.read(),
      placas: reader.read(),
      fecha: reader.read(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Vehiculo obj) {
    writer.write(obj.marca);
    writer.write(obj.modelo);
    writer.write(obj.anio);
    writer.write(obj.motor);
    writer.write(obj.color);
    writer.write(obj.vn);
    writer.write(obj.kms);
    writer.write(obj.placas);
    writer.write(obj.fecha);
  }
}
