import 'package:aplicacion_mecanico/visualizacion/detalles_de_cliente.dart';
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
  var box = Hive.box('clientes');
  var clientesbox = Hive.box('clientes').values.toList();
  List<dynamic> clientes = [];

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
      body: ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            var b = clientesbox[index];

            return Card(
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
                      clientesbox[index].nombre,
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
                      if (value == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Ver_DatosCliente();
                            },
                          ),
                        );
                      }
                      if (value == 2) {}
                      if (value == 3) {
                        showDialog(
                            context: context,
                            builder: (buildcontext) {
                              return AlertDialog(
                                title: Text('Eliminar Cliente'),
                                content: const Text(
                                    "¿Seguro que quieres eliminar este cliente? (se eliminaran los carros agregados)"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Hive.box('clientes').deleteAt(index);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text('Aceptar'))
                                ],
                              );
                            });
                      }
                    },
                    icon: Icon(Icons.more_vert_outlined),
                  )
                ]));
          }),
      floatingActionButton: BotonEspeed(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  /* void _showAlertDialog(index) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: Text(
                "¿Seguro que quieres eliminar este cliente? (se eliminaran los carros agregados)"),
            actions: <Widget>[
              FilledButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FilledButton(
                child: Text(
                  "Aceptar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Hive.box('clientes').deleteAll(index);
                  Navigator.pop(context);
                  setState(() {});
                },
              )
            ],
          );
        });
  }*/
}
