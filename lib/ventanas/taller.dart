import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../componentes/barradbusqueda.dart';
import '../componentes/botonspeed.dart';

class Taller extends StatelessWidget {
  const Taller({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('vehiculos');
    var vehiculosbox = Hive.box('vehiculos').values.toList();
    List<dynamic> vehiculos = [];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Taller'),
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
      body: ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            var b = vehiculosbox[index];

            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(20),
                elevation: 3,
                child: Row(children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  ImageIcon(vehiculosbox[index].modelo),
                ]));
          }),
      floatingActionButton: BotonEspeed(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
