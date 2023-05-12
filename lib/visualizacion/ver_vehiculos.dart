import 'package:aplicacion_mecanico/componentes/barradbusqueda.dart';
import 'package:aplicacion_mecanico/componentes/barradbusquedaautos.dart';
import 'package:aplicacion_mecanico/componentes/botonspeed.dart';
import 'package:aplicacion_mecanico/visualizacion/Nuevov_Detallesservicio.dart';

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
  var box = Hive.box('vehiculos');

  var boxvehiculos = Hive.box('vehiculos').values.toList();
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
                  context: context, delegate: BarradeBusquedaAutos(vehiculos));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            var b = boxvehiculos[index];

            return Card(
              color: Color.fromARGB(255, 193, 196, 203),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Row(children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 49,
                      width: 36,
                      child: Icon(
                        Icons.car_rental,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Column(
                  children: [
                    Text(
                      boxvehiculos[index].marca,
                      style: GoogleFonts.hanuman(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      boxvehiculos[index].color,
                      style: GoogleFonts.hanuman(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      boxvehiculos[index].modelo,
                      style: GoogleFonts.hanuman(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 80,
                ),
                PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Mas detalles"),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Entregar Vehiculo"),
                    ),
                  ],
                  initialValue: 0,
                  //  onCanceled: () {
                  // print("You have canceled the menu.");
                  //  },
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => V_DetallesServicio()),
                      );
                    }
                    if (value == 2) {}
                  },
                  icon: Icon(
                    Icons.more_vert_outlined,
                    size: 40,
                  ),
                )
              ]),
            );
          }),
      floatingActionButton: BotonEspeed(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      //body: ListView.builder(itemBuilder: (context, index) {}),
    );
  }
}
