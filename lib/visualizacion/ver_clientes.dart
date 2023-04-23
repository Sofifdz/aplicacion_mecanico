import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../componentes/barradbusqueda.dart';
import '../componentes/botonspeed.dart';

class Ver_clientes extends StatefulWidget {
  const Ver_clientes({super.key});

  @override
  State<StatefulWidget> createState() {
    return Ver_clientesState();
  }
}

class Ver_clientesState extends State<Ver_clientes> {
  // var bb = Hive.openBox('clientes');
  //var clientesbox = Hive.box('clientes').values.toList();
  List<dynamic> clientes = [];
  //var boxclientes = Hive.box('clientes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Clientes'),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BarradeBusqueda(clientes));
            },
          ),
        ],
      ),
      floatingActionButton: BotonEspeed(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
