import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../componentes/barradbusqueda.dart';
import '../componentes/botonspeed.dart';

class Taller extends StatelessWidget {
  const Taller({super.key});

  @override
  Widget build(BuildContext context) {
    // var bb = Hive.openBox('vehiculos');
    // var vehiculosbox = Hive.box('vehiculos').values.toList();
    List<dynamic> vehiculos = [];
    //var boxvehiculos = Hive.box('vehiculos');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Taller'),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: BarradeBusqueda(vehiculos));
            },
          ),
        ],
      ),
      floatingActionButton: BotonEspeed(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
