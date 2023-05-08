import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Vehiculo extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String imagen;
  @HiveField(2)
  String marca;
  @HiveField(3)
  String modelo;
  @HiveField(4)
  String anio;
  @HiveField(5)
  String motor;
  @HiveField(6)
  String color;
  @HiveField(7)
  String vn;
  @HiveField(8)
  String kms;
  @HiveField(9)
  String placas;
  @HiveField(10)
  String fecha;
  @HiveField(11)
  String? clienteNombre;


  Vehiculo(
      {
      required this.id,
      required this.imagen,
      required this.marca,
      required this.modelo,
      required this.anio,
      required this.motor,
      required this.color,
      required this.vn,
      required this.kms,
      required this.placas,
      required this.fecha,
      required this.clienteNombre}) {}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
      'cliente': clienteNombre
    };
  }

  @override
  String toString() {
    return 'Vehiculo{id: $id,imagen: $imagen, marca: $marca, modelo: $modelo,anio: $anio,motor:$motor, color: $color,vn: $vn,kms: $kms,placas: $placas,fecha: $fecha,cliente: $clienteNombre}';
  }
}

class VehiculoAdapter extends TypeAdapter<Vehiculo> {
  @override
  Vehiculo read(BinaryReader reader) {
    return Vehiculo(

      id: reader.read(),
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
      clienteNombre: reader.read(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Vehiculo obj) {
    writer.write(obj.id);
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
    writer.write(obj.clienteNombre);
  }
}
