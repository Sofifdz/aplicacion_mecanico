import 'package:aplicacion_mecanico/clases/claseVehiculo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class BarradeBusquedaAutos extends SearchDelegate<Vehiculo> {
  var bb = Hive.openBox('vehiculos');
  var vehiculosbox = Hive.box('vehiculos').values.toList();
  List<dynamic> vehiculos = [];
  var boxvehiculos = Hive.box('vehiculos');
  List<dynamic> _filter = [];

  BarradeBusquedaAutos(this.vehiculos);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Lista(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = vehiculosbox.where((vehiculo) {
      return vehiculo.modelo.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return Lista(context);
  }

  @override
  Widget Lista(BuildContext context) {
    _filter = vehiculosbox.where((vehiculo) {
      return vehiculo.modelo.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (context, index) {
          final vehiculo = vehiculosbox[index];

          var v = boxvehiculos.getAt(index);

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
                Expanded(
                  child: Center(
                      child: Text(
                    _filter[index].modelo,
                    style: GoogleFonts.hanuman(
                      fontSize: 25,
                    ),
                  )),
                ),
              ]));
        });
  }
}
