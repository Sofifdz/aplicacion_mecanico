import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive/hive.dart';

class BotonEspeed extends StatelessWidget {
  const BotonEspeed({super.key});

  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add, //icon on Floating action button
      activeIcon: Icons.close, //icon when menu is expanded on button
      backgroundColor: Colors.blue, //background color of button
      foregroundColor: Colors.white, //font color, icon color in button
      activeBackgroundColor:
          Colors.white, //background color when menu is expanded
      activeForegroundColor: Colors.black,

      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      children: [
        SpeedDialChild(
          child: Icon(Icons.car_repair, color: Colors.black),
          backgroundColor: Colors.blue[300],
          label: 'Agregar vehiculo',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          labelBackgroundColor: Colors.blue[300],
        ),
        SpeedDialChild(
          child: Icon(Icons.create, color: Colors.black),
          backgroundColor: Colors.blue[500],
          label: 'Agregar Servicio',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          labelBackgroundColor: Colors.blue[500],
        ),
        SpeedDialChild(
          child: Icon(Icons.person_add, color: Colors.black),
          backgroundColor: Colors.blue[700],
          label: 'Agregar Cliente',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          labelBackgroundColor: Colors.blue[700],
        ),
      ],
    );
  }
}
