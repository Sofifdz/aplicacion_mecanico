import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class Citas extends HiveObject {
  @HiveField(0)
  String titulo = '';
  @HiveField(1)
  String descripcion = '';
  @HiveField(2)
  DateTime to;
  @HiveField(3)
  DateTime from;
  @HiveField(4)
  Color color;
  @HiveField(5)
  final bool isallday;

  Citas({
    required this.titulo,
    required this.descripcion,
    required this.to,
    required this.from,
    this.color = Colors.grey,
    this.isallday = false,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'to': to,
      'from': from,
      'color': color,
      'isallday': isallday,
    };
  }

  @override
  String toString() {
    return 'Citas{titulo: $titulo, descripcion: $descripcion, to: $to,from: $from,color:$color,isallday:$isallday}';
  }
}

class CitasAdapter extends TypeAdapter<Citas> {
  @override
  Citas read(BinaryReader reader) {
    return Citas(
      titulo: reader.read(),
      descripcion: reader.read(),
      to: reader.read(),
      from: reader.read(),
      color: reader.read(),
      isallday: reader.read(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, Citas obj) {
    writer.write(obj.titulo);
    writer.write(obj.descripcion);
    writer.write(obj.to);
    writer.write(obj.from);
    writer.write(obj.color);
    writer.write(obj.isallday);
  }
}
