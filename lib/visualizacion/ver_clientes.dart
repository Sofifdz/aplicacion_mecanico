import 'package:aplicacion_mecanico/componentes/barradbusqueda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

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

  List<TextEditingController> controllers = [];
  List<TextEditingController> controllersalias = [];
  List<TextEditingController> controllertelefono = [];
  List<TextEditingController> controllertelefonoad = [];
  List<TextEditingController> controllercorreo = [];
  List<TextEditingController> controllerdomicilio = [];

  void actualizarInformacion(int index) {
    var cliente = clientesbox[index];
    cliente.nombre = controllers[index].text;
    cliente.alias = controllersalias[index].text;
    cliente.telefono = controllertelefono[index].text;
    cliente.telefonoadicional = controllertelefonoad[index].text;
    cliente.email = controllercorreo[index].text;
    cliente.ciudad = controllerdomicilio[index].text;
    box.putAt(index, cliente);
  }

  @override
  Widget build(BuildContext context) {
    clientesbox.forEach((cliente) {
      controllers.add(TextEditingController(text: cliente.nombre));
      controllersalias.add(TextEditingController(text: cliente.alias));
      controllertelefono.add(TextEditingController(text: cliente.telefono));
      controllertelefonoad
          .add(TextEditingController(text: cliente.telefonoadicional));
      controllercorreo.add(TextEditingController(text: cliente.email));
      controllerdomicilio.add(TextEditingController(text: cliente.ciudad));
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Clientes'),
        titleTextStyle:
            GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
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
            final cliente = clientesbox[index];

            var v = box.getAt(index);

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
                            builder: (context) => Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.blue[900],
                                  title: const Text(
                                    'Detalles del cliente,',
                                  ),
                                ),
                                body: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Carros del cliente',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 280,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 86, 140, 255),
                                                      width: 2,
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 86, 140, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Datos del cliente',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 86, 140, 255),
                                                    width: 2,
                                                  ),
                                                  color: Color.fromARGB(
                                                      255, 86, 140, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 35),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Nombre: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllers[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .nombre,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        181,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Alias: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllersalias[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .alias,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        181,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Telefono: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllertelefono[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .telefono,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        181,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Telefono Adicional: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllertelefonoad[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText: clientesbox[
                                                                        index]
                                                                    .telefonoadicional,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        181,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Correo: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllercorreo[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .email,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        181,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Domicilio: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllerdomicilio[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .ciudad,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        181,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 35,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            // Actualiza el nombre del cliente en la base de datos
                                                            actualizarInformacion(
                                                                index);
                                                            // Actualiza los demás campos del cliente en la base de datos
                                                            var cliente =
                                                                clientesbox[
                                                                    index];
                                                            cliente.alias =
                                                                controllersalias[
                                                                        index]
                                                                    .text;
                                                            cliente.telefono =
                                                                controllertelefono[
                                                                        index]
                                                                    .text;
                                                            cliente.telefonoadicional =
                                                                controllertelefonoad[
                                                                        index]
                                                                    .text;
                                                            cliente.email =
                                                                controllercorreo[
                                                                        index]
                                                                    .text;
                                                            cliente.ciudad =
                                                                controllerdomicilio[
                                                                        index]
                                                                    .text;
                                                            box.putAt(
                                                                index, cliente);

                                                            // Actualiza la lista de clientes para reflejar los cambios
                                                            setState(() {
                                                              clientes = box
                                                                  .values
                                                                  .toList();
                                                            });

                                                            // Muestra un mensaje de confirmación
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  content: Text(
                                                                      'Cliente actualizado')),
                                                            );
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    195,
                                                                    214,
                                                                    255),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            elevation: 5,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            child: Text(
                                                              'Actualizar',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 35),
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }

                      if (value == 2) {
                        showDialog(
                            context: context,
                            builder: (buildcontext) {
                              return AlertDialog(
                                title: Text('Eliminar Cliente'),
                                titleTextStyle: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                content: const Text(
                                    "¿Seguro que quieres eliminar este cliente? (se eliminaran los carros agregados)"),
                                contentTextStyle: GoogleFonts.hanuman(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar',
                                        style: GoogleFonts.hanuman(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Hive.box('clientes').deleteAt(index);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text('Aceptar',
                                        style: GoogleFonts.hanuman(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  )
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

  /*void _showAlertDialog(index) {
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
                  Hive.box('clientes');
                  boxclientes.deleteAll(clientesbox[index]);
                  setState(() {});
                },
              )
            ],
          );
        });*/
}
