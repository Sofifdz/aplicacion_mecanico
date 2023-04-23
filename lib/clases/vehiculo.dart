import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Vehiculo extends HiveObject {
  @HiveField(0)
  String imagen = '';
  @HiveField(1)
  String marca = '';
  @HiveField(2)
  String modelo = '';
  @HiveField(3)
  String anio = '';
  @HiveField(4)
  String motor = '';
  @HiveField(5)
  String color = '';
  @HiveField(6)
  String vn = '';
  @HiveField(7)
  double kms = 0;
  @HiveField(8)
  String placas = '';
  @HiveField(9)
  String fecha = '';
  @HiveField(10)
  String cliente = '';

  Vehiculo(
      {required this.imagen,
      required this.marca,
      required this.modelo,
      required this.anio,
      required this.motor,
      required this.color,
      required this.vn,
      required this.kms,
      required this.placas,
      required this.fecha,
      required this.cliente}) {}

  Map<String, dynamic> toMap() {
    return {
      'imagen': imagen,
      'marca': marca,
      'modelo': modelo,
      'anio': anio,
      'motor': motor,
      'color': color,
      'vn': vn,
      'kms': kms,
      'placas': placas,
      'fecha': fecha,
      'cliente': cliente
    };
  }

  @override
  String toString() {
    return 'Vehiculo{imagen: $imagen, marca: $marca, modelo: $modelo,anio: $anio,motor:$motor, color: $color,vn: $vn,kms: $kms,placas: $placas,fecha: $fecha,cliente: $cliente}';
  }
}

class VehiculoAdapter extends TypeAdapter<Vehiculo> {
  @override
  Vehiculo read(BinaryReader reader) {
    return Vehiculo(
      imagen: reader.read(),
      marca: reader.read(),
      modelo: reader.read(),
      anio: reader.read(),
      motor: reader.read(),
      color: reader.read(),
      vn: reader.read(),
      kms: reader.read(),
      placas: reader.read(),
      fecha: reader.read(),
      cliente: reader.read(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Vehiculo obj) {
    writer.write(obj.imagen);
    writer.write(obj.marca);
    writer.write(obj.modelo);
    writer.write(obj.anio);
    writer.write(obj.motor);
    writer.write(obj.color);
    writer.write(obj.vn);
    writer.write(obj.kms);
    writer.write(obj.placas);
    writer.write(obj.fecha);
    writer.write(obj.cliente);
  }
}
