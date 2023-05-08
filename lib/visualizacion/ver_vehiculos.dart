import 'package:aplicacion_mecanico/componentes/barradbusqueda.dart';
import 'package:aplicacion_mecanico/componentes/botonspeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Ver_Vehiculos extends StatefulWidget {
  const Ver_Vehiculos({super.key});

  @override
  State<Ver_Vehiculos> createState() => _Ver_VehiculosState();
}

class _Ver_VehiculosState extends State<Ver_Vehiculos> {
  // var bb = Hive.openBox('vehiculos');
  //var box = Hive.box('vehiculos');

  // var boxvehiculos = Hive.box('vehiculos').values.toList();
  List<dynamic> vehiculos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Vehiculos'),
        titleTextStyle:
            GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
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
      //body: ListView.builder(itemBuilder: (context, index) {}),
    );
  }
}
