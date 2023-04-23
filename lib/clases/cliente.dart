import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Cliente extends HiveObject {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String telefono = '';
  @HiveField(2)
  String email = '';
  @HiveField(3)
  String ciudad = '';

  Cliente({
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.ciudad,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'ciudad': ciudad,
    };
  }

  @override
  String toString() {
    return 'Cliente{nombre: $nombre, telefono: $telefono, email: $email,ciudad: $ciudad}';
  }
}

class ClienteAdapter extends TypeAdapter<Cliente> {
  @override
  Cliente read(BinaryReader reader) {
    return Cliente(
      nombre: reader.read(),
      telefono: reader.read(),
      email: reader.read(),
      ciudad: reader.read(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Cliente obj) {
    writer.write(obj.nombre);
    writer.write(obj.telefono);
    writer.write(obj.email);
    writer.write(obj.ciudad);
  }
}
