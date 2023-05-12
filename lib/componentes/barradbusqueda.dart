import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../clases/cliente.dart';

class BarradeBusqueda extends SearchDelegate<Cliente> {
  var bb = Hive.openBox('clientes');
  var clientesbox = Hive.box('clientes').values.toList();
  List<dynamic> clientes = [];
  var boxclientes = Hive.box('clientes');
  List<dynamic> _filter = [];

  BarradeBusqueda(this.clientes);

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
    _filter = clientesbox.where((cliente) {
      return cliente.nombre.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return Lista(context);
  }

  @override
  Widget Lista(BuildContext context) {
    _filter = clientesbox.where((cliente) {
      return cliente.nombre.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (context, index) {
          final cliente = clientesbox[index];

          var v = boxclientes.getAt(index);

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
                    _filter[index].nombre,
                    style: GoogleFonts.hanuman(
                      fontSize: 25,
                    ),
                  )),
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
                      child: Text("Agregar Carro"),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text("Eliminar Cliente"),
                    ),
                  ],
                  initialValue: 0,
                  //  onCanceled: () {
                  // print("You have canceled the menu.");
                  //  },
                  onSelected: (value) {
                    if (value == 1) {}
                    if (value == 2) {}
                    if (value == 3) {}
                  },
                  icon: Icon(Icons.more_vert_outlined),
                )
              ]));
        });
  }
}
