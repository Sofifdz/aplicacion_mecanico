import 'package:aplicacion_mecanico/clases/claseVehiculo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Cliente extends HiveObject {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String alias = '';
  @HiveField(2)
  String telefono = '';
  @HiveField(3)
  String telefonoadicional = '';
  @HiveField(4)
  String email = '';
  @HiveField(5)
  String ciudad = '';
  @HiveField(6)
  List<Vehiculo> vehiculos;

  Cliente({
    required this.nombre,
    required this.alias,
    required this.telefono,
    required this.telefonoadicional,
    required this.email,
    required this.ciudad,
    required this.vehiculos,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'alias': alias,
      'telefono': telefono,
      'telefonoadicional': telefonoadicional,
      'email': email,
      'ciudad': ciudad,
      'vehiculos': vehiculos,
    };
  }

  @override
  String toString() {
    return 'Cliente{nombre: $nombre, alias: $alias, telefono: $telefono, telefonoadicional: $telefonoadicional, email: $email,ciudad: $ciudad,vehiculos:$vehiculos}';
  }
}

class ClienteAdapter extends TypeAdapter<Cliente> {
  @override
  Cliente read(BinaryReader reader) {
    return Cliente(
      nombre: reader.read(),
      alias: reader.read(),
      telefono: reader.read(),
      telefonoadicional: reader.read(),
      email: reader.read(),
      ciudad: reader.read(),
      vehiculos: List<Vehiculo>.from(reader.read()),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Cliente obj) {
    writer.write(obj.nombre);
    writer.write(obj.alias);
    writer.write(obj.telefono);
    writer.write(obj.telefonoadicional);
    writer.write(obj.email);
    writer.write(obj.ciudad);
    writer.write(obj.vehiculos);
  }
}
